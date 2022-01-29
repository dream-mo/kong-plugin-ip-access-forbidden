local IpAccessForbiddenHandler = {}

IpAccessForbiddenHandler.PRIORITY = 1
IpAccessForbiddenHandler.VERSION = "0.1.0"

function IpAccessForbiddenHandler:access(conf)
    local ip_addresses = conf.ip_addresses
    local host = kong.request.get_header('Host')
    kong.ctx.plugin.is_ip_access = false
    for index, ip in pairs(ip_addresses) do
        if ip == host then
            kong.ctx.plugin.is_ip_access = true
            break
        end
    end
end

function IpAccessForbiddenHandler:response(conf)
    local is_ip_access = kong.ctx.plugin.is_ip_access
    if (is_ip_access) then
        kong.response.exit(conf.status_code, conf.tip_message)
    end
end

return IpAccessForbiddenHandler


