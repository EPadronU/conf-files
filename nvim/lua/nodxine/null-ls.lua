local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then
  return
end

null_ls.setup {
  sources = {
    -- Injects actions to change gitrebase command
    null_ls.builtins.code_actions.gitrebase,

    -- Injects code actions for Git operations at the current cursor position (stage / preview /
    -- reset hunks, blame, etc.)
    null_ls.builtins.code_actions.gitsigns,

    -- A fast, open-source, static analysis tool for finding bugs and enforcing code standards
    -- https://semgrep.dev
    null_ls.builtins.diagnostics.semgrep.with {
      extra_args = function(params)
        if params.ft == "java" then
          return {
            "--config", vim.fn.expand("~/.local/share/semgrep/java.semgrep.yaml"),
            "--config", "p/java",
            "--config", "p/secrets",
            "--config", "r/java.log4j.security.log4j-message-lookup-injection.log4j-message-lookup-injection",
          }
        end

        return {}
      end,

      -- Avoid using quite a lot of CPU after formatting the document
      method = null_ls.methods.DIAGNOSTICS_ON_SAVE,

      -- With a lot of rules it takes its time
      timeout = 10000, -- (ms)
    },
  }
}
