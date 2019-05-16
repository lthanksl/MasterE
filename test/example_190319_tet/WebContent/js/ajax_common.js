
/*--------------------------------------------------
기능   : Ajax 호출
INPUT 
p_url : 호출할 페이지 주소/함-수명 (예: 'MasterTest.aspx/GetDataTable')
p_data : 함수에 전달할 파라메타 (예: '{param1:4 , param2:2}'
p_success : 통신 성공시 처리해야될 함수 
p_error : 통신 실패시 처리해야될 함수
p_type : Http 프로토콜 ( "GET" or "POST")
p_timeout : Timeout(밀리초)
p_datatype : xml , html ,script , json , jsonp , text
p_contentType : application/xml , text/xml , text/html , text/plain , application/json , text/javascript
p_async : true - 비동기 통신 , false - 동기 통신 
RETURN : NONE
---------------------------------------------------
예제 
plusAjax.send('페이지명.aspx/함수명' , '{파라메터1:8 , 파라메터:2}' , 성공이벤트스크립트함수)
plusAjax.send('페이지명.aspx/함수명' , '{파라메터1:8 , 파라메터:2}' , 성공이벤트스크립트함수 , 실패이벤트스크립트함수)
plusAjax.send('페이지명.aspx/함수명' , '{파라메터1:8 , 파라메터:2}' , 성공이벤트스크립트함수 , 실패이벤트스크립트함수 , "GET") - Post , Get 방식
plusAjax.send('페이지명.aspx/함수명' , '{파라메터1:8 , 파라메터:2}' , 성공이벤트스크립트함수 , 실패이벤트스크립트함수 , "GET" , 4000) Timeout 4초 
plusAjax.send('페이지명.aspx/함수명' , '{파라메터1:8 , 파라메터:2}' , 성공이벤트스크립트함수 , 실패이벤트스크립트함수 , "GET" , 4000 , 'json' ,'application/json') json으로 데이터 송수신 
plusAjax.send('페이지명.aspx/함수명' , '{파라메터1:8 , 파라메터:2}' , 성공이벤트스크립트함수 , 실패이벤트스크립트함수 , "GET" , 4000 , 'json' ,'application/json' , true) 비동기 통신
---------------------------------------------------*/


function PlusAjax()
{
    var default_type = "POST";
    var default_timeout = 0; //설정 안함
    var default_datatype = "json";
    var default_contentType = "application/json";
    var default_async = true;
    var ajaxResultProc = new PlusAjaxProcess();

    addMethod(this, "send", function (p_url, p_success)
    {
    	jsAjaxCall(p_url, null, p_success, ajaxResultProc, default_type, default_timeout, default_datatype, default_contentType, default_async);
    });

    addMethod(this, "send", function (p_url, p_data, p_success)
    {
        jsAjaxCall(p_url, p_data, p_success , ajaxResultProc, default_type, default_timeout, default_datatype, default_contentType, default_async);
    });

    addMethod(this, "send", function (p_url, p_data, p_success, p_error)
    {
        ajaxResultProc.addError(p_error);
        jsAjaxCall(p_url, p_data, p_success, ajaxResultProc, default_type, default_timeout, default_datatype, default_contentType, default_async);
    });

    addMethod(this, "send", function (p_url, p_data, p_success, p_error, p_type)
    {
        ajaxResultProc.addError(p_error);
        jsAjaxCall(p_url, p_data, p_success, ajaxResultProc, p_type, default_timeout, default_datatype, default_contentType, default_async);
    });

    addMethod(this, "send", function (p_url, p_data, p_success, p_error, p_type, p_timeout)
    {
        ajaxResultProc.addError(p_error);
        jsAjaxCall(p_url, p_data, p_success, ajaxResultProc, p_type, p_timeout, default_datatype, default_contentType, default_async);
    });

    addMethod(this, "send", function (p_url, p_data, p_success, p_error, p_type, p_timeout, p_datatype, p_contentType)
    {
        ajaxResultProc.addError(p_error);
        jsAjaxCall(p_url, p_data, p_success, ajaxResultProc, p_type, p_timeout, p_datatype, p_contentType, default_async);
    });

    addMethod(this, "send", function (p_url, p_data, p_success, p_error, p_type, p_timeout, p_datatype, p_contentType, p_async)
    {
        ajaxResultProc.addError(p_error);
        jsAjaxCall(p_url, p_data, p_success, ajaxResultProc, p_type, p_timeout, p_datatype, p_contentType, p_async);
    });

    addMethod(this, "send", function (p_url)
    {
        return jsAjaxCallSync(p_url, default_type, default_timeout, default_datatype, default_contentType);
    });

    addMethod(this, "addErrorHandler", function (p_error)
    {
        ajaxResultProc.addError(p_error);
    });

    addMethod(this, "addComleteHandler", function (p_complete)
    {
        ajaxResultProc.addComplete(p_complete);
    });

    addMethod(this, "addBeforeSendHandler", function (p_beforesend)
    {
        ajaxResultProc.addBeforeSend(p_beforesend);
    });

    addMethod(this, "addDisableControlID", function (p_controlID)
    {
        ajaxResultProc.addDisableControl(p_controlID);
    });

    addMethod(this, "abort", function ()
    {
        ajaxResultProc.abort();
    });

    addMethod(this, "addTargetControl", function (p_control)
    {
        ajaxResultProc.addTargetControl(p_control);
    });
}

function PlusAjaxProcess()
{
    var fn_ajaxError;           //ajax 사용자 지정 에러 함수
    var fn_ajaxBeforeSend;      //ajax 사용자 지정 요청전 호출 함수 
    var fn_ajaxComplete;        //ajax 사용자 처리 완료 시 호출 함수
    var ajaxRequest;            //ajax를 요청할 Request 객체
    var ajaxControl;            //ajax 요청시 disabled할 html control
    var targetControl;          //spiner를 띄워줄 대상 html 컨트롤
    var spinner;                //spiner 클래스
    var disableControls = new Array();  //ajax 실행중 disables할 컨트롤 목록
    var opts =
    {
        lines:  15, // The number of lines to draw  
        length: 6, // The length of each line  
        width: 6, // The line thickness  
        radius: 20, // The radius of the inner circle  
        color: '#000', // #rgb or #rrggbb  
        speed: 1, // Rounds per second  
        trail: 40, // Afterglow percentage  
        shadow: true // Whether to render a shadow
    };

    addMethod(this, "error", function (request, status, error)
    {
    	if (spinner != null)
    	{
    		setTimeout(function () { spinner.stop(); }, 300);
    	}

    	if (status != "abort")
    	{
    		alert(error);
    	}

    	if (typeof fn_ajaxError == 'function')
    	{
    		try
    		{
    			fn_ajaxError.call(request, status, error);
    			fn_ajaxError = false;
    		}
    		catch (exception)
    		{
    		    alert("fn_ajaxError" + exception.description);
    		}
    	}
    });


    addMethod(this, "complete", function (request, settings)
    {
        try
        {
            if (spinner != null)
            {
            	//setTimeout(function () { spinner.stop(); }, 50); 
            	spinner.stop();
            }
            if (disableControls != null && disableControls.length > 0)
            {
                for (var i = 0; i < disableControls.length; i++)
                {
                    document.getElementById(disableControls[i]).disabled = false;
                }
            }

            if (typeof fn_ajaxComplete == 'function')
            {
                fn_ajaxComplete.call(request, settings);
                fn_ajaxComplete = false;
            }
        }
        catch (exception)
        {
            alert(exception.description);
        }

    });

    addMethod(this, "beforesend", function (request, settings)
    {
    	try
    	{
//    		if (!flag)
//    		{
//    			spinner = new Spinner(opts).spin(window.document.body);
//    			//spinner.stop();
//    		}

    		if (targetControl != null)
    		{
    			spinner = new Spinner(opts).spin(targetControl);
    		}

    		if (disableControls != null && disableControls.length > 0)
    		{
    			for (var i = 0; i < disableControls.length; i++)
    			{
    				document.getElementById(disableControls[i]).disabled = true;
    			}
    		}

    		ajaxRequest = request;
    		if (typeof fn_ajaxBeforeSend == 'function')
    		{
    			fn_ajaxBeforeSend.call(request, settings);
    			fn_ajaxBeforeSend = false;
    		}
    	}
    	catch (exception)
    	{
    		alert(exception.description);
    	}


    });

    addMethod(this, "addTargetControl", function (p_control)
    {
        targetControl = p_control;
    });

    addMethod(this, "addDisableControl", function (p_controlID)
    {
        disableControls.push(p_controlID);
    });

    addMethod(this, "addError", function (p_error)
    {
        fn_ajaxError = p_error;
    });

    addMethod(this, "addComplete", function (p_complete)
    {
        fn_ajaxComplete = p_complete;
    });

    addMethod(this, "addBeforeSend", function (p_beforesend)
    {
        fn_ajaxBeforeSend = p_beforesend;

    });

    addMethod(this, "abort", function ()
    {
        if (ajaxRequest != null)
        {
            ajaxRequest.abort();
        }
    });
}

function addMethod(object, name, fn)
{
    var old = object[name];
    object[name] = function ()
    {
        if (fn.length == arguments.length)
            return fn.apply(this, arguments);
        else
            if (typeof old == 'function')
                return old.apply(this, arguments);
    };
}

function jsAjaxCall(p_url, p_data, p_success, ajaxResultProc, p_type, p_timeout, p_datatype, p_contentType, p_async)
{
    
    try
    {
        $.ajax({
            type: p_type,
            url: p_url,
            data: p_data,
            contentType: p_contentType,
            dataType: p_datatype,
            success: p_success,
            error: ajaxResultProc.error,
            timeout: p_timeout,
            async: p_async,
            complete: ajaxResultProc.complete,
            beforeSend: ajaxResultProc.beforesend
        });
    }
    catch (exception)
    {
        alert("jsAjaxCall" + exception.description);
    }
}

function jsAjaxCallSync(p_url, p_type, p_timeout, p_datatype, p_contentType)
{
    var rerurnData;
    try
    {
        $.ajax({
            type: "POST",
            async: false,
            url: p_url,
            data: null,
            dataType: "json",
            contentType: "application/json",
            success: function (msg)
            {
                var objData = eval(msg);
                if (jsIsCheckResult(objData))
                {
                    rerurnData = objData;
                }
            },
            error: function (request, status, error)
            {
                alert(error);
            }
        });
    }
    catch (exception)
    {
        alert("jsAjaxCall" + exception.description);
    }
    return rerurnData;
}


/*--------------------------------------------------
기능   : Ajax로 Resource  문자열 가져오기
INPUT 
p_resourceTarget : 리소스 파일명 
p_resourceKey : 리소스 키
RETURN : 리소스 메시지
---------------------------------------------------
예제 
jsGetResourceMessage('리소스 파일명' , '리소스 키')
---------------------------------------------------*/
function jsGetResourceMessage(p_resourceTarget, p_resourceKey)
{
    var resourceData;
    var sPath = window.location.pathname;
    var sPage = sPath.substring(sPath.lastIndexOf('/') + 1);
    var data = "{resourceFile : '" + p_resourceTarget + "', resourceKey: '" + p_resourceKey + "'}";
    var url = sPage + "/GetClientResource";

    try
    {
        $.ajax({
            type: "POST",
            async: false,
            url: url,
            data: data,
            dataType: "json",
            contentType: "application/json",
            success: function (msg)
            {
                var objData = eval(msg.d);

                if (jsIsCheckResult(objData))
                {
                    resourceData = objData[1].data;
                }
            },
            error: function (request, status, error)
            {
                alert(error);
            }

        });
    }
    catch (exception)
    {
        alert(exception.description);
    }

    return resourceData;
}

/*--------------------------------------------------
기능   : Ajax로 Resource  문자열 포맷형으로 가져오기
INPUT 
p_resourceTarget : 리소스 파일명 
p_resourceKey : 리소스 키
p_format : 포맷할 문자열 (두개 이상일 때 - 'data1,data2,data3' 
RETURN : 리소스 메시지
---------------------------------------------------
예제 
jsGetResourceMessage('리소스 파일명' , '리소스 키')
---------------------------------------------------*/
function jsGetResourceFormatMessage(p_resourceTarget, p_resourceKey , p_format)
{
    var resourceData;
    var sPath = window.location.pathname;
    var sPage = sPath.substring(sPath.lastIndexOf('/') + 1);
    var data = "{resourceFile : '" + p_resourceTarget + "', resourceKey: '" + p_resourceKey + "' , formatString: '" + p_format + "'}";
    var url = sPage + "/GetClientFormatResource";

    try
    {
    	$.ajax({
    		type: "POST",
    		async: false,
    		url: url,
    		data: data,
    		dataType: "json",
    		contentType: "application/json",
    		success: function (msg)
    		{
    			var objData = eval(msg.d);

    			if (jsIsCheckResult(objData))
    			{
    				resourceData = objData[1].data;
    			}
    		},
    		error: function (request, status, error)
    		{
    			alert(error);
    		}

    	});
    }
    catch (exception)
    {
        alert(exception.description);
    }

    return resourceData;
}


/*--------------------------------------------------
기능   : Ajax 성공여부 판단하는 함수
INPUT 
p_data : Ajax 성공시 전달받은 Data 
RETURN : 성공 여부
---------------------------------------------------
예제 
jsGetExceptionMessage('리소스키' , 성공이벤트스크립트함수 , 실패이벤트스크립트함수)
---------------------------------------------------*/
function jsIsCheckResult(p_data)
{
    var result = p_data[0].result;
    var message = p_data[0].message;

    if (result != null && result == "1")
    {
        return true;
    }

    alert(message);
    return false;
}
