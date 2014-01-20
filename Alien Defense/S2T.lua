--[[
Project: String2Table
Author: CMP
Version: 1.0

Converts strings to tables and vice-versa.
--]]

local S2T={}

local stringToTable
local tableToString

local function findAll(str,char)
	local t={}
	for i=1, #str do
		if str:sub(i, i)==char then
			t[#t+1]=i
		end
	end
	return t
end

local function removeChars(str,char)
	return str:gsub(char, "")
end

local function isNumeric(str) 
	return tonumber(str) and true or false 
end

local function getValue(str)
	local returnString=str
	if returnString=="true" then
		return true
	elseif returnString=="false" then
		return false
	elseif isNumeric(returnString) then
		return tonumber(returnString)
	else
		return returnString
	end
end

local function toValue(v)
	local returnString=v
	if returnString==true then
		return "true"
	elseif returnString==false then
		return "false"
	elseif type(v)=="number" then
		return tostring(returnString)
	elseif type(v)=="string" then
		return "\""..v.."\""
	elseif type(v)=="table" then
		return tableToString(v)
	else
		return returnString
	end
end

function stringToTable(str)
	local str=str
	str=removeChars(str, " ")
	
	local t={}	
	local stringValues={}
	local prevComma=2
	
	local commaTable=findAll(str, ",")
	
	for i=1, #commaTable+1 do
		stringValues[#stringValues+1]=str:sub(prevComma, commaTable[i])
		
		stringValues[#stringValues]=removeChars(stringValues[#stringValues], ",")
		stringValues[#stringValues]=removeChars(stringValues[#stringValues], "}")
		stringValues[#stringValues]=removeChars(stringValues[#stringValues], "{")
		stringValues[#stringValues]=removeChars(stringValues[#stringValues], "\t")
		stringValues[#stringValues]=removeChars(stringValues[#stringValues], "\n")
		stringValues[#stringValues]=removeChars(stringValues[#stringValues], "\"")
		
		prevComma=commaTable[i]
	end
	
	for i=1, #stringValues do
		local equalSign, nilValue=string.find(stringValues[i], "=")
		nilValue=nil
		
		local leftSide=string.sub(stringValues[i], 1, equalSign-1)
		
		local rightSide=string.sub(stringValues[i], equalSign+1, #stringValues[i])
		
		t[leftSide]=getValue(rightSide)
	end
		
	return t
end

function tableToString(t)
	local t=t
	
	local str="{"
	
	local tableIsNumbered=false
	
	local throughFirst=false
	
	for k, v in pairs(t) do
		if t[k] then
			tableIsNumbered=false
		end
	end
	
	for i=1, #t do
		if t[i] then
			tableIsNumbered=true
		end
	end
		
	if tableIsNumbered then
		for i=1, #t do
			if i~=1 then
				str=str..", "
			end
			str=str..toValue(t[i])
		end
	else
		for k, v in pairs(t) do
			if throughFirst then
				str=str..", "
			end
			str=str..k.."="..toValue(t[k])
			throughFirst=true			
		end
	end
	
	str=str.."}"
	
	return str
end

S2T.stringToTable=stringToTable
S2T.tableToString=tableToString
return S2T