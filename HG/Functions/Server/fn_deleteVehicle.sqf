/*
    Author - HoverGuy
    © All Fucks Reserved
    Website - http://www.sunrise-production.com
*/
params["_unit","_plate"];

if(!HG_SAVING_EXTDB) then
{
    private["_garage","_index"];
	
    _garage = profileNamespace getVariable[format["HG_Garage_%1",(getPlayerUID _unit)],[]];
    _index = [_plate,_garage] call HG_fnc_findIndex;
    _garage deleteAt _index;
	
    profileNamespace setVariable[format["HG_Garage_%1",(getPlayerUID _unit)],_garage];
	
    if((getNumber(missionConfigFile >> "CfgClient" >> "enableVehicleInventorySave")) isEqualTo 1) then
    {
	    profileNamespace setVariable[format["HG_Inventory_%1_%2",(getPlayerUID _unit),_plate],nil];
    };
	
    saveProfileNamespace;
} else {
    private _query = if(HG_SAVING_PROTOCOL isEqualTo "SQL") then
	{
	    format["DELETE FROM HG_Vehicles WHERE PID = '%1' AND PLATE = '%2'",(getPlayerUID _unit),_plate]
	} else {
	    format["HG_vehicleDelete:%1:%2",(getPlayerUID _unit),_plate];
	};
	
	// Send delete query here
};

(localize "STR_HG_GRG_VEHICLE_DELETED") remoteExecCall ["hint",(owner _unit),false];
	
true;