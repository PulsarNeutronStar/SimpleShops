/*
    Author - HoverGuy
    © All Fucks Reserved
    Website - http://www.sunrise-production.com
*/
params["_mode","_oldVal","_newVal"];

_oldVal = profileNamespace getVariable "HG_KillCount";

_newVal = switch(_mode) do
{
    case 0: 
	{
		_oldVal + 1;
	};
	case 1:
	{
		_oldVal - 1;
	};
};

if(_newVal < 0) then 
{
    _newVal = 0
};

profileNamespace setVariable["HG_KillCount",_newVal];
saveProfileNamespace;

[4] call HG_fnc_HUD;

true;
