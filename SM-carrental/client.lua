esx = nil
ESX = exports["es_extended"]:getSharedObject()
local display = false
-- bikes
local bike1 = Config.bike1
local bike2 = Config.bike2
local bike3 = Config.bike3
--cars
local car1 = Config.car1
local car2 = Config.car2
local car3 = Config.car3
--offroad
local offroad1 = Config.offroad1
local offroad2 = Config.offroad2
local offroad3 = Config.offroad3
local pedcoords = Config.pedcoords
local ped = Config.ped

local pedModel = Config.ped
local pedCoords = vector4(Config.pedCoords.x, Config.pedCoords.y, Config.pedCoords.z, Config.pedCoords.h)

RequestModel(pedModel)

while not HasModelLoaded(pedModel) do
    Wait(500)
end

local ped = CreatePed(1, pedModel, pedCoords.x, pedCoords.y, pedCoords.z, pedCoords.h, true, false)
FreezeEntityPosition(ped, true)
SetPedCombatAbility(ped, true)


function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = 'ui',
        status = bool,
    })
end

exports.ox_target:addBoxZone({
    coords = vec3(Config.oxtarget.x, Config.oxtarget.y, Config.oxtarget.z),
    size = vec3(2, 2, 2),
    rotation = 45,
    debug = drawZones,
    options = {
        {
            name = 'Huur Voertuig',
            event = 'nui:open',
            serverEvent = 'remove:money',
            icon = 'fa-solid fa-car',
            label = Config.Locales["rent_vehicle"],
        }
    }
})


RegisterNetEvent('nui:open', function(...)
    SetDisplay(not display)
  end)


Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)

        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride

    end
end)

RegisterNUICallback("close", function()
    SetDisplay(false)
end)

-- car 1
RegisterNUICallback('car-1', function(data)
    SetDisplay(false)
    local rentingInputOptions = {
        { label = 'Rent for 10 mins', value = 'option1' },
        { label = 'Rent for 1 hour', value = 'option2' },
        { label = 'Rent for 6 hours', value = 'option3' },
    }

    local rentInput = lib.inputDialog('Vehicle Rental', {
        {
            type = 'select',
            label = 'Renting Duration',
            description = 'Choose how long you want to rent the vehicle',
            required = true,
            icon = 'vehicle-icon', -- Replace
            options = rentingInputOptions,
        },
    })

    -- Access the selected option and print it
    local selectedOption = rentInput[1]

    if selectedOption == 'option1' then
        local modelHash = Config.car1
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(600000)
            DeleteEntity(entity)
        end
    elseif selectedOption == 'option2' then
        -- option 2
        local modelHash = Config.car1
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(3600000)
            DeleteEntity(entity)
        end
    elseif selectedOption == 'option3' then
        -- option 3
        local modelHash = Config.car1
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(21600000)
            DeleteEntity(entity)
        end
    else
        print('Invalid selection')
    end
end)

-- car 2
RegisterNUICallback('car-2', function(data)
    SetDisplay(false)
    local rentingInputOptions = {
        { label = 'Rent for 10 mins', value = 'option1' },
        { label = 'Rent for 1 hour', value = 'option2' },
        { label = 'Rent for 6 hours', value = 'option3' },
    }

    local rentInput = lib.inputDialog('Vehicle Rental', {
        {
            type = 'select',
            label = 'Renting Duration',
            description = 'Choose how long you want to rent the vehicle',
            required = true,
            icon = 'vehicle-icon', -- Replace
            options = rentingInputOptions,
        },
    })

    -- Access the selected option and print it
    local selectedOption = rentInput[1]

    if selectedOption == 'option1' then
        local modelHash = Config.car1
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(600000)
            DeleteEntity(entity)
        end
    elseif selectedOption == 'option2' then
        -- option 2
        local modelHash = Config.car1
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(3600000)
            DeleteEntity(entity)
        end
    elseif selectedOption == 'option3' then
        -- option 3
        local modelHash = Config.car1
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(21600000)
            DeleteEntity(entity)
        end
    else
        print('Invalid selection')
    end
end)

-- car 3
RegisterNUICallback('car-3', function(data)
    SetDisplay(false)
    local rentingInputOptions = {
        { label = 'Rent for 10 mins', value = 'option1' },
        { label = 'Rent for 1 hour', value = 'option2' },
        { label = 'Rent for 6 hours', value = 'option3' },
    }

    local rentInput = lib.inputDialog('Vehicle Rental', {
        {
            type = 'select',
            label = 'Renting Duration',
            description = 'Choose how long you want to rent the vehicle',
            required = true,
            icon = 'vehicle-icon', -- Replace
            options = rentingInputOptions,
        },
    })

    -- Access the selected option and print it
    local selectedOption = rentInput[1]

    if selectedOption == 'option1' then
        local modelHash = Config.car1
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(600000)
            DeleteEntity(entity)
        end
    elseif selectedOption == 'option2' then
        -- option 2
        local modelHash = Config.car1
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(3600000)
            DeleteEntity(entity)
        end
    elseif selectedOption == 'option3' then
        -- option 3
        local modelHash = Config.car1
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(21600000)
            DeleteEntity(entity)
        end
    else
        print('Invalid selection')
    end
end)

RegisterNUICallback('bike-1', function(data)
    SetDisplay(false)
    local rentingInputOptions = {
        { label = 'Rent for 10 mins', value = 'option1' },
        { label = 'Rent for 1 hour', value = 'option2' },
        { label = 'Rent for 6 hours', value = 'option3' },
    }

    local rentInput = lib.inputDialog('Vehicle Rental', {
        {
            type = 'select',
            label = 'Renting Duration',
            description = 'Choose how long you want to rent the vehicle',
            required = true,
            icon = 'vehicle-icon', -- Replace
            options = rentingInputOptions,
        },
    })

    -- Access the selected option and print it
    local selectedOption = rentInput[1]

    if selectedOption == 'option1' then
        local modelHash = Config.bike1
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(600000)
            DeleteEntity(entity)
        end
    elseif selectedOption == 'option2' then
        -- option 2
        local modelHash = Config.bike1
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(3600000)
            DeleteEntity(entity)
        end
    elseif selectedOption == 'option3' then
        -- option 3
        local modelHash = Config.bike1
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(21600000)
            DeleteEntity(entity)
        end
    else
        print('Invalid selection')
    end
end)

RegisterNUICallback('bike-2', function(data)
    SetDisplay(false)
    local rentingInputOptions = {
        { label = 'Rent for 10 mins', value = 'option1' },
        { label = 'Rent for 1 hour', value = 'option2' },
        { label = 'Rent for 6 hours', value = 'option3' },
    }

    local rentInput = lib.inputDialog('Vehicle Rental', {
        {
            type = 'select',
            label = 'Renting Duration',
            description = 'Choose how long you want to rent the vehicle',
            required = true,
            icon = 'vehicle-icon', -- Replace
            options = rentingInputOptions,
        },
    })

    -- Access the selected option and print it
    local selectedOption = rentInput[1]

    if selectedOption == 'option1' then
        local modelHash = Config.bike2
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(600000)
            DeleteEntity(entity)
        end
    elseif selectedOption == 'option2' then
        -- option 2
        local modelHash = Config.bike2
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(3600000)
            DeleteEntity(entity)
        end
    elseif selectedOption == 'option3' then
        -- option 3
        local modelHash = Config.bike2
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(21600000)
            DeleteEntity(entity)
        end
    else
        print('Invalid selection')
    end
end)

RegisterNUICallback('bike-3', function(data)
    SetDisplay(false)
    local rentingInputOptions = {
        { label = 'Rent for 10 mins', value = 'option1' },
        { label = 'Rent for 1 hour', value = 'option2' },
        { label = 'Rent for 6 hours', value = 'option3' },
    }

    local rentInput = lib.inputDialog('Vehicle Rental', {
        {
            type = 'select',
            label = 'Renting Duration',
            description = 'Choose how long you want to rent the vehicle',
            required = true,
            icon = 'vehicle-icon', -- Replace
            options = rentingInputOptions,
        },
    })

    -- Access the selected option and print it
    local selectedOption = rentInput[1]

    if selectedOption == 'option1' then
        local modelHash = Config.bike3
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(600000)
            DeleteEntity(entity)
        end
    elseif selectedOption == 'option2' then
        -- option 2
        local modelHash = Config.bike3
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(3600000)
            DeleteEntity(entity)
        end
    elseif selectedOption == 'option3' then
        -- option 3
        local modelHash = Config.bike3
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(21600000)
            DeleteEntity(entity)
        end
    else
        print('Invalid selection')
    end
end)



-- offroad section.
RegisterNUICallback('offroad-1', function(data)
    SetDisplay(false)
    local rentingInputOptions = {
        { label = 'Rent for 10 mins', value = 'option1' },
        { label = 'Rent for 1 hour', value = 'option2' },
        { label = 'Rent for 6 hours', value = 'option3' },
    }

    local rentInput = lib.inputDialog('Vehicle Rental', {
        {
            type = 'select',
            label = 'Renting Duration',
            description = 'Choose how long you want to rent the vehicle',
            required = true,
            icon = 'vehicle-icon', -- Replace
            options = rentingInputOptions,
        },
    })

    -- Access the selected option and print it
    local selectedOption = rentInput[1]

    if selectedOption == 'option1' then
        local modelHash = Config.offroad1
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(600000)
            DeleteEntity(entity)
        end
    elseif selectedOption == 'option2' then
        -- option 2
        local modelHash = Config.offroad1
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(3600000)
            DeleteEntity(entity)
        end
    elseif selectedOption == 'option3' then
        -- option 3
        local modelHash = Config.offroad1
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(21600000)
            DeleteEntity(entity)
        end
    else
        print('Invalid selection')
    end
end)

RegisterNUICallback('offroad-2', function(data)
    SetDisplay(false)
    local rentingInputOptions = {
        { label = 'Rent for 10 mins', value = 'option1' },
        { label = 'Rent for 1 hour', value = 'option2' },
        { label = 'Rent for 6 hours', value = 'option3' },
    }

    local rentInput = lib.inputDialog('Vehicle Rental', {
        {
            type = 'select',
            label = 'Renting Duration',
            description = 'Choose how long you want to rent the vehicle',
            required = true,
            icon = 'vehicle-icon', -- Replace
            options = rentingInputOptions,
        },
    })

    -- Access the selected option and print it
    local selectedOption = rentInput[1]

    if selectedOption == 'option1' then
        local modelHash = Config.offroad2
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(600000)
            DeleteEntity(entity)
        end
    elseif selectedOption == 'option2' then
        -- option 2
        local modelHash = Config.offroad2
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(3600000)
            DeleteEntity(entity)
        end
    elseif selectedOption == 'option3' then
        -- option 3
        local modelHash = Config.offroad2
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(21600000)
            DeleteEntity(entity)
        end
    else
        print('Invalid selection')
    end
end)

RegisterNUICallback('offroad-3', function(data)
    SetDisplay(false)
    local rentingInputOptions = {
        { label = 'Rent for 10 mins', value = 'option1' },
        { label = 'Rent for 1 hour', value = 'option2' },
        { label = 'Rent for 6 hours', value = 'option3' },
    }

    local rentInput = lib.inputDialog('Vehicle Rental', {
        {
            type = 'select',
            label = 'Renting Duration',
            description = 'Choose how long you want to rent the vehicle',
            required = true,
            icon = 'vehicle-icon', -- Replace
            options = rentingInputOptions,
        },
    })

    -- Access the selected option and print it
    local selectedOption = rentInput[1]

    if selectedOption == 'option1' then
        local modelHash = Config.offroad3
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(600000)
            DeleteEntity(entity)
        end
    elseif selectedOption == 'option2' then
        -- option 2
        local modelHash = Config.offroad3
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(3600000)
            DeleteEntity(entity)
        end
    elseif selectedOption == 'option3' then
        -- option 3
        local modelHash = Config.offroad3
        RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
            Wait(0)
        end

        local vehicle = CreateVehicle(modelHash, -1594.1912, -1052.6776, 13.0176, 144.5709, true, false)

        lib.notify({
            title = 'Vehicle Rental',
            description = 'You Successfully Rented The Vehicle Enjoy!',
            type = 'fail'
        })

        SetDisplay(false)
        TriggerServerEvent('remove:money')
        local netId = NetworkGetNetworkIdFromEntity(vehicle)

        if netId ~= 0 then
            local entity = NetworkGetEntityFromNetworkId(netId)
            Wait(21600000)
            DeleteEntity(entity)
        end
    else
        print('Invalid selection')
    end
end)