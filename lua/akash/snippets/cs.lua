-- ~/.config/nvim/lua/akash/snippets/cs.lua
-- Unity & C# snippets for LuaSnip
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- MonoBehaviour class template (mb + Tab)
  s("mb", {
    t({ "using UnityEngine;", "", "" }),
    t("public class "),
    i(1, "MyClass"),
    t(" : MonoBehaviour"),
    t({ "", "{", "    " }),
    i(2, "// Start is called before the first frame update"),
    t({ "", "    void Start()", "    {", "        " }),
    i(3),
    t({ "", "    }", "", "    void Update()", "    {", "        " }),
    i(4),
    t({ "", "    }", "}" }),
  }),

  -- Start method
  s("start", {
    t("void Start()"),
    t({ "", "{" }),
    t({ "    " }),
    i(1),
    t({ "", "}" }),
  }),

  -- Update method
  s("update", {
    t("void Update()"),
    t({ "", "{" }),
    t({ "    " }),
    i(1),
    t({ "", "}" }),
  }),

  -- Serialized private field
  s("serf", {
    t("[SerializeField]"),
    t({ "", "private " }),
    i(1, "int"),
    t(" "),
    i(2, "value"),
    t({ "", "" }),
  }),

  -- Debug.Log
  s("log", {
    t('Debug.Log("'),
    i(1, "message"),
    t('");'),
  }),

  -- GetComponent shortcut
  s("gc", {
    t("GetComponent<"),
    i(1, "ComponentType"),
    t(">()"),
  }),

  -- Coroutine template
  s("corr", {
    t("private IEnumerator "),
    i(1, "MyCoroutine"),
    t("()"),
    t({ "", "{" }),
    t({ "    " }),
    i(2),
    t({ "", "    yield return null;", "}" }),
  }),

  -- RequireComponent attribute
  s("req", {
    t("[RequireComponent(typeof("),
    i(1, "ComponentType"),
    t("))]"),
  }),

  -- Property with backing field (prop)
  s("prop", {
    t("private "),
    i(1, "int"),
    t(" "),
    i(2, "field"),
    t({ "", "public " }),
    f(function(args)
      return args[1][1]:gsub("^%l", string.upper)
    end, { 2 }),
    t({ "", "{" }),
    t({ "", "    get => " }),
    i(3, "field"),
    t({ ";", "    set => " }),
    i(4, "field"),
    t({ ";", "}" }),
  }),

  -- Debug.Assert
  s("assert", {
    t("Debug.Assert("),
    i(1, "condition"),
    t({ ");" }),
  }),

  -- [ContextMenu]
  s("cm", {
    t('[ContextMenu("'),
    i(1, "MenuName"),
    t('")]'),
    t({ "", "private void " }),
    i(2, "MethodName"),
    t("()"),
    t({ "", "{" }),
    t({ "    " }),
    i(3),
    t({ "", "}" }),
  }),

  -- Quick namespace + using
  s("ns", {
    t("using System;"),
    t({ "", "using UnityEngine;", "", "namespace " }),
    i(1, "MyNamespace"),
    t({ "", "{", "    " }),
    i(2),
    t({ "", "}" }),
  }),

  -- OnCollisionEnter stub
  s("oco", {
    t("void OnCollisionEnter(Collision collision)"),
    t({ "", "{" }),
    t({ "    " }),
    i(1),
    t({ "", "}" }),
  }),

  -- Tooltip + SerializeField
  s("tool", {
    t('[SerializeField, Tooltip("'),
    i(1, "tooltip"),
    t('")]'),
    t({ "", "private " }),
    i(2, "int"),
    t(" "),
    i(3, "value"),
    t({ "", "" }),
  }),
}
