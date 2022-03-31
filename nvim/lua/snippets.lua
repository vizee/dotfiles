local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

ls.add_snippets('go', {
    s('hlsql', {
        t({ '// language=MySQL' }),
    }),
    s('iferr', {
        t({ 'if err != nil {', "\treturn " }),
        i(1, "nil"),
        t({ ', err', '}' }),
        i(0),
    }),
}, {
    key = 'go',
})
