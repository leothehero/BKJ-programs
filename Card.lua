local component = require("component")
local writer = component.os_cardwriter
local magReader = component.proxy("fc91d79f-5720-430c-a0d5-72b094262b99")
local shell = require("shell")
local args, opts = shell.parse(...)
