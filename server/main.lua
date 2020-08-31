ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

local Items = {
    'depo1',
    'depo2',
    'depo3',
    'depo4',
}

ESX.RegisterServerCallback('hsnrobb:copCount', function(source, cb)
	local xPlayers = ESX.GetPlayers()

	copConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			copConnected = copConnected + 1
		end
	end

	cb(copConnected)
end)

RegisterServerEvent('hsn:para3')
AddEventHandler('hsn:para3', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local hasluck = math.random(1500,2500)
    local RandomItem = Items[math.random(1, #Items)]
    local amount = math.random(1,4)
    
   -- xPlayer.addMoney(hasluck)
    xPlayer.addInventoryItem(RandomItem, amount)
  --  TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Kasadan  '..RandomItem.. ' ve '..hasluck..' para buldun  !'})
end)

ESX.RegisterUsableItem('policecardd', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('hsnnnnnnnn', source)

end)

RegisterServerEvent('hsn:sell1')
AddEventHandler('hsn:sell1', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local depo1 = 0
    local siktir = math.random(50, 60)
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "depo1" then
			depo1 = item.count
		end
	end
				
		if depo1 > 0 then
			xPlayer.removeInventoryItem('depo1', 1)
			xPlayer.addMoney(siktir)
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Benzin deposunu sattın ve '..siktir..'$ para kazandın!'})
		else 
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Satacak Benzin Depon yok.'})
		end
end)


RegisterServerEvent('hsn:sell2')
AddEventHandler('hsn:sell2', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local depo2 = 0
    local siktir2 = math.random(50, 60)
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "depo2" then
			depo2 = item.count
		end
	end
				
		if depo2 > 0 then
			xPlayer.removeInventoryItem('depo2', 1)
			xPlayer.addMoney(siktir2)
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Benzin deposunu sattın ve '..siktir2..'$ para kazandın!'})
		else 
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Satacak Dolu Benzin Depon yok.'})
		end
end)

RegisterServerEvent('hsn:sell3')
AddEventHandler('hsn:sell3', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local depo3 = 0
    local siktir3 = math.random(50, 60)
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "depo3" then
			depo3 = item.count
		end
	end
				
		if depo3 > 0 then
			xPlayer.removeInventoryItem('depo3', 1)
			xPlayer.addMoney(siktir3)
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Benzin deposunu sattın ve '..siktir3..'$ para kazandın!'})
		else 
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Satacak Dolu Benzin Depon yok.'})
		end
end)

RegisterServerEvent('hsn:sell4')
AddEventHandler('hsn:sell4', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local depo4 = 0
    local siktir4 = math.random(50, 60)
			
	for i=1, #xPlayer.inventory, 1 do
		local item = xPlayer.inventory[i]
			
		if item.name == "depo4" then
			depo4 = item.count
		end
	end
				
		if depo4 > 0 then
			xPlayer.removeInventoryItem('depo4', 1)
			xPlayer.addMoney(siktir4)
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Benzin deposunu sattın ve '..siktir4..'$ para kazandın!'})
		else 
			TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = 'Satacak Dolu Benzin Depon yok.'})
		end
end)