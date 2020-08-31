--------------------------------------------------------teamDemo-----------------------------------------------------------------
ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

local starttt = false
local ara = false
local PlayerData = {}

local holdingup = false
local hsn31 = 0 

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(5)
    end
end

AddEventHandler('animm', function()
    loadAnimDict('veh@break_in@0h@p_m_one@')
     if not IsEntityPlayingAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3) then
      TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
      Citizen.Wait(1500)
      ClearPedTasks(PlayerPedId())
     end
     Citizen.Wait(1)
    ClearPedTasks(PlayerPedId())
   end)

local start = {
    {x = 2753.04, y = 1509.65, z = 24.5},
   }

   local arass = {
    [1] = {x = 2778.83, y = 1508.14, z = 24.5, isOpen = false},
    [2] = {x = 2780.36, y = 1513.87, z = 24.52, isOpen = false},
    [3] = {x = 2733.7, y = 1520.51, z = 24.5, isOpen = false},
    [4] = {x = 2740.34, y = 1531.23, z = 24.5, isOpen = false},
    [5] = {x = 2762.1, y = 1534.81, z = 24.5, isOpen = false},
}

local satthhh = {
   {x = 149.93, y = -1684.25, z = 29.45},  
}

Citizen.CreateThread(function()
    for k,v in pairs(Config.pedloc) do
        local ped_hash = -396800478
        RequestModel(ped_hash)
        while not HasModelLoaded(ped_hash) do
            Citizen.Wait(1)
        end
        ped = CreatePed(1, ped_hash, v.coords, v.heading, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)   
    end
end)

Citizen.CreateThread(function ()
       while true do
           Citizen.Wait(5)
           local playerPed = GetPlayerPed(-1)
           local coords, shn  = GetEntityCoords(PlayerPedId()), true
           for k,v in pairs(start) do
               if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1 then 
                   DrawText3Ds(v.x, v.y, v.z+0.50, "[E] Basla")
                   if IsControlJustReleased(0,119) then
                     if not holdingup then
                        ESX.TriggerServerCallback('hsnrobb:copCount', function(cops)
                            if cops >= Config.LSPD then -- polis sayısı
                           -- TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_STAND_MOBILE", 0, true)
						    exports["aex-bar"]:taskBar(3000, "Soygun Başlıyor! ")    
                            ClearPedTasks(PlayerPedId())
                            hsnnn() 
                            holdingup = true                
                        else
                            TriggerEvent("notification", 'Şehirde yeterli polis yok', 2)      
                        end       
                    end)
                        else
                         TriggerEvent('notification', "Şuan bunu yapamazsın!", 2)      
                    end
                else
            end
        end
    end

    if holdingup then    
    for a,b in pairs(arass) do
            if GetDistanceBetweenCoords(coords, b.x, b.y, b.z, true) < 1 and not b.isOpen then 
                DrawText3Ds(b.x, b.y, b.z+0.50, "[E] Ara")
                if IsControlJustReleased(0,119) then
                    atsizzzzzzzzz()
                     TriggerServerEvent('hsn:para3')
                     ClearPedTasks(PlayerPedId()) 
                     b.isOpen = true
                     hsn31 = hsn31
                     if hsn31 == Config.Ara then 
                        b.isOpen = false
                        hsn31 = 0  
                    end
                end
            end
        end
    end 
    end
end)


Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local coords, letSleep  = GetEntityCoords(PlayerPedId()), true
        for k,v in pairs(satthhh) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v.x, v.y, v.z) < 1 then
                letSleep = false
                DrawText3Ds(v.x, v.y, v.z+0.50, "[E] Konus")
                if IsControlJustReleased(0,119) then
                    satt()
                end               
            end
        end
        if letSleep then
            Citizen.Wait(1000)
        end
    end
end) 



RegisterCommand('soyguniptal', function(...)
    local plyData = ESX.GetPlayerData()
    local coords = GetEntityCoords(PlayerPedId())
    for k,v in pairs(start) do
    if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1 then
	if plyData and plyData.job and plyData.job.name == "police" then
		exports["aex-bar"]:taskBar(3500, "İptal Ediliyor! ")
        atsizz()
    else
        ESX.ShowNotification('Polis Değilsin!')
    end
    end
    end
end)

function atsizz()
    SetBlackout(false)
end  



function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.0002+ factor, 0.025, 0, 0, 0, 50)
end  



function hsnnn()
    for k,v in pairs(start) do
    TriggerEvent("notification", 'Başarılı')
	RequestAnimDict('anim@heists@ornate_bank@thermal_charge_heels')
	while not HasAnimDictLoaded('anim@heists@ornate_bank@thermal_charge_heels') do
	Citizen.Wait(50)
	end
    local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
    local plyData = ESX.GetPlayerData()
	prop = CreateObject(GetHashKey('prop_c4_final_green'), x, y, z+0.2,  true,  true, true)
	AttachEntityToEntity(prop, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 60309), 0.06, 0.0, 0.06, 90.0, 0.0, 0.0, true, true, false, true, 1, true)
	SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"),true)
	--FreezeEntityPosition(GetPlayerPed(-1), true)
	TaskPlayAnim(GetPlayerPed(-1), 'anim@heists@ornate_bank@thermal_charge_heels', "thermal_charge", 3.0, -8, -1, 63, 0, 0, 0, 0 )
	Citizen.Wait(5500)
	ClearPedTasks(GetPlayerPed(-1))
	DetachEntity(prop)
	AttachEntityToEntity(prop, v.x, v.y , v.z, GetEntityBoneIndexByName(v.x, v.y , v.z, 'door_pside_r'), -0.7, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
	exports["aex-bar"]:taskBar(5000, "Bomba Bekleniyor! ")   
    --FreezeEntityPosition(GetPlayerPed(-1), false)
    memo()  
    AddExplosion(v.x,v.y,v.z, 'EXPLOSION_TANKER', 2.0, true, false, 2.0)
    if plyData and plyData.job and plyData.job.name == "police" then
    TriggerEvent('hsn:setblip2')  
    SetBlackout(true)
    end
end
end

  
function memo()  
    for k,v in pairs(arass) do
    AddExplosion(v.x,v.y,v.z, 'EXPLOSION_TANKER', 2.0, true, false, 2.0)
    end
end    


function atsizzzzzzzzz()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
    exports["aex-bar"]:taskBar(55000, "Açılıyor! ")
    ClearPedTasksImmediately(PlayerPedId())
end

function satt()
    ESX.UI.Menu.CloseAll()
  
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'pawn_sell_menu',
        {
            title    = 'Alıcı',
            elements = {
                {label = 'Benzin Deposu', value = 'depo1'},
                {label = 'Dolu Benzin Deposu', value = 'depo2'},
                {label = 'Kablo', value = 'depo3'},
                {label = 'İşe Yarar Kablo', value = 'depo4'},
            }
        },
        function(data, menu)
            if data.current.value == 'depo1' then
                TriggerServerEvent('hsn:sell1')
            elseif data.current.value == 'depo2' then
                TriggerServerEvent('hsn:sell2')
            elseif data.current.value == 'depo3' then
                TriggerServerEvent('hsn:sell3')
            elseif data.current.value == 'depo4' then
                TriggerServerEvent('hsn:sell4')
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
  end

  RegisterNetEvent('hsnnnnnnnn')
  AddEventHandler('hsnnnnnnnn', function()
    local plyData = ESX.GetPlayerData()
    local playerPed = GetPlayerPed(-1)
    local coords, shn  = GetEntityCoords(PlayerPedId()), true
    if plyData and plyData.job and plyData.job.name == "police" then
    for k,v in pairs(start) do
        if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1 then 
            exports["aex-bar"]:taskBar(60000, "Soygun Etkisiz Hale Getiriliyor! ") 
            atsizz()
        else
            TriggerEvent("notification", 'Polis Değilsin!', 2)
           end
        end
    end
end) 

RegisterNetEvent('hsn:setblip2')
AddEventHandler('hsn:setblip2', function()
    local coords = {x = 2753.06, y = 1510.15, z = 24.5}
    exports["mythic_notify"]:SendAlert("infrom", "Soygun Alarmı Tetiklendi, Şehrin Elektriği Kesildi!", 5000, {["background-color"] = "#CD472A", ["color"] = "#ffffff"})
    blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 161)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 75)
end)


--------------------------------------------------------teamDemo-----------------------------------------------------------------

