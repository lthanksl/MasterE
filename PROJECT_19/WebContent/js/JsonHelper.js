/*----------------------------------------------------------
기능   : JSON 객체를 string 문자열로 바꿔준다.
INPUT  : json 객체
RETURN : string 문자열
예     : 
-----------------------------------------------------------*/
function objectToJSONString(object)
{
	var isArray = (object.join && object.pop && object.push
                    && object.reverse && object.shift && object.slice && object.splice);

	//isArray가 true 일 경우 :
	//isArray가 false 일 경우 : "{"list" : {"0" : {"MinNo" : "A", "MinLocation" : "B", "MinSend" : "C"}, "1" : {"MinNo" : "AA", "MinLocation" : "BB", "MinSend" : "CC"}}}"
	//isArray가 undefined 일 경우 : "{"list" : [["A", "B", "C"], ["AA", "BB", "CC"]]}"

	isArray = false;

	var results = [];

	for (var i in object)
	{
		var value = object[i];

		if (typeof value == "object")
			results.push((isArray ? "" : "\"" + i.toString() + "\" : ")
                             + objectToJSONString(value));
		else if (value)
			results.push((isArray ? "" : "\"" + i.toString() + "\" : ")
                            + (typeof value == "string" ? "\"" + value + "\"" : value));
	}

	return (isArray ? "[" : "{") + results.join(", ") + (isArray ? "]" : "}");
}