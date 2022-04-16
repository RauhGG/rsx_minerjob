ESX = exports["es_extended"]:getSharedObject()

local blips = {
	{title="Mina", colour=2, id=486, x = 2949.489, y = 2742.047, z = 43.59823}
}

local enable = false

RegisterNetEvent('rsx_minero:enservicio', function(bool)
enable = bool
end)

CreateThread(function()
	for _, info in pairs(blips) do
	  info.blip = AddBlipForCoord(info.x, info.y, info.z)
	  SetBlipSprite(info.blip, info.id)
	  SetBlipDisplay(info.blip, 4)
	  SetBlipScale(info.blip, 0.5)
	  SetBlipColour(info.blip, info.colour)
	  SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
	  AddTextComponentString(info.title)
	  EndTextCommandSetBlipName(info.blip)
	end
 end)

CreateThread(function()
	  blip = AddBlipForCoord(-97.31409, -1013.626, 27.27524)
	  SetBlipSprite(blip, 478)
	  SetBlipDisplay(blip, 4)
	  SetBlipScale(blip, 0.5)
	  SetBlipColour(blip, 25)
	  SetBlipAsShortRange(blip, true)
	  BeginTextCommandSetBlipName("STRING")
	  AddTextComponentString('Venta de minerales')
	  EndTextCommandSetBlipName(blip)
 end)
-- Herramienta
Citizen.CreateThread(function()
    while true do
        local _sleep = 1000
        local ped = PlayerPedId()
        local _charPos = GetEntityCoords(ped)
        if #(_charPos - vector3( 2949.489, 2742.047, 43.59823)) < 2 then
            _sleep = 0
        ESX.ShowFloatingHelpNotification("[~r~E~w~] Herramienta", vector3( 2949.489, 2742.047, 43.59823))
        if IsControlJustPressed(0, 38) then
            TriggerServerEvent('rsx_minero:herramienta')
    		end
		end
Citizen.Wait(_sleep)
	end
end)

-- Mina de hierro
local waitiron = true

Citizen.CreateThread(function()
    while true do
        local _sleep = 1000
        local ped = PlayerPedId()
        local _charPos = GetEntityCoords(ped)
        if #(_charPos - vector3(2951.316, 2769.084, 39.0346)) < 2 and waitiron and enable then
            _sleep = 0
        ESX.ShowFloatingHelpNotification("[~r~E~w~] Minar hierro", vector3(2951.316, 2769.084, 39.0346))
        if IsControlJustPressed(0, 38) then
            TriggerServerEvent('rsx_minero:checkiron')
    end
end
Citizen.Wait(_sleep)
	end
end)

local minadohierro = 0

RegisterNetEvent('rsx_minero:minarhierro', function()
	local veces = math.random(10)
	waitiron = false
	minadohierro = minadohierro + 1
	local dict = loadDict('melee@hatchet@streamed_core')
	FreezeEntityPosition(PlayerPedId(), true)
   	TaskPlayAnim(PlayerPedId(), dict, 'plyr_rear_takedown_b', 8.0, -8.0, -1, 2, 0, false, false, false)
   	Wait(3000)
   	ClearPedTasksImmediately(PlayerPedId())
   	waitiron = true
   	print('mined')
   	FreezeEntityPosition(PlayerPedId(), true)

	if minadohierro >= veces then
		minadohierro = 0
		TriggerServerEvent('rsx_minero:darhierro')
	end
end)


--Mina de oro
local waitoro = true

Citizen.CreateThread(function()
    while true do
        local _sleep = 1000
        local ped = PlayerPedId()
        local _charPos = GetEntityCoords(ped)
        if #(_charPos - vector3(2938.123, 2772.332, 39.251)) < 2 and waitoro and enable then
            _sleep = 0
        ESX.ShowFloatingHelpNotification("[~r~E~w~] Minar oro", vector3(2938.123, 2772.332, 39.251))
        if IsControlJustPressed(0, 38) then
            TriggerServerEvent('rsx_minero:checkoro')
    end
end
Citizen.Wait(_sleep)
	end
end)

local minadooro = 0

RegisterNetEvent('rsx_minero:minaroro', function()
	local veces = math.random(15)
	waitoro = false
	minadooro = minadooro + 1
	local dict = loadDict('melee@hatchet@streamed_core')
	FreezeEntityPosition(PlayerPedId(), true)
   	TaskPlayAnim(PlayerPedId(), dict, 'plyr_rear_takedown_b', 8.0, -8.0, -1, 2, 0, false, false, false)
   	Wait(3000)
   	ClearPedTasksImmediately(PlayerPedId())
   	waitoro = true
   	print('mined')
   	FreezeEntityPosition(PlayerPedId(), true)

	if minadooro >= veces then
		minadooro = 0
		TriggerServerEvent('rsx_minero:daroro')
	end
end)


-- Minar diamante
local waitdiam = true

Citizen.CreateThread(function()
    while true do
        local _sleep = 1000
        local ped = PlayerPedId()
        local _charPos = GetEntityCoords(ped)
        if #(_charPos - vector3(2928.743, 2787.668, 39.76796)) < 2 and waitdiam and enable then
            _sleep = 0
        ESX.ShowFloatingHelpNotification("[~r~E~w~] Minar diamante", vector3(2928.743, 2787.668, 39.76796))
        if IsControlJustPressed(0, 38) then
            TriggerServerEvent('rsx_minero:checkdiam')
    end
end
Citizen.Wait(_sleep)
	end
end)

local minadodiam = 0

RegisterNetEvent('rsx_minero:minardiam', function()
	local veces = math.random(15)
	waitdiam = false
	minadodiam = minadodiam + 1
	local dict = loadDict('melee@hatchet@streamed_core')
	FreezeEntityPosition(PlayerPedId(), true)
   	TaskPlayAnim(PlayerPedId(), dict, 'plyr_rear_takedown_b', 8.0, -8.0, -1, 2, 0, false, false, false)
   	Wait(3000)
   	ClearPedTasksImmediately(PlayerPedId())
   	waitdiam = true
   	print('mined')
   	FreezeEntityPosition(PlayerPedId(), true)

	if minadodiam >= veces then
		minadodiam = 0
		TriggerServerEvent('rsx_minero:dardiam')
	end
end)
-- Punto de venta
Citizen.CreateThread(function()
    while true do
        local _sleep = 1000
        local ped = PlayerPedId()
        local _charPos = GetEntityCoords(ped)
        if #(_charPos - vector3(-97.10489, -1013.561, 27.27522)) < 2 and waitdiam then
            _sleep = 0
        ESX.ShowFloatingHelpNotification("[~r~E~w~] Llamar a la puerta", vector3(-97.10489, -1013.561, 27.27522))
        if IsControlJustPressed(0, 38) then
            vender()
    end
end
Citizen.Wait(_sleep)
	end
end)
-- Funciones
loadDict = function(dict, anim)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
    return dict
end

vender = function()
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vender',{
        title = 'Quieres vender tus minerales?',
		align = 'center',
		elements = {
			{label = 'Si', value = 'sell'},
			{label = 'No', value = 'no'},
		}
	},
	function(data, menu)
		local val = data.current.value
		
		if val == 'sell' then
        TriggerServerEvent('rsx_minero:sell')
        elseif val == 'no' then
        	ESX.UI.Menu.CloseAll()
		end
	end,
	function(data, menu)
		menu.close()
	end)
end