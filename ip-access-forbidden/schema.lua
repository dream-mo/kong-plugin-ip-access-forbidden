local typedefs = require "kong.db.schema.typedefs"

return {
    name = "ip-access-forbidden",
    fields = {
        {
            config = {
                type = "record",
                fields = {
                    { hosts = { type = "array", required = true, elements = typedefs.host_with_optional_port }, },
                    { status_code = { type = "integer", required = false, default = 403 } },
                    { tip_message = { type = "string", required = false, default = "Access Forbidden" } }
                },
            },
        },
    },
}
