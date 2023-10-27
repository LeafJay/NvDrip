return {
  "tjdevries/express_line.nvim",
  config = function()
    local generator = function(_window, buffer)
      local extensions = require('el.extensions')
      local subscribe = require('el.subscribe')

      local file_icon = subscribe.buf_autocmd(
        "el_file_icon",
        "BufRead",
        function(_)
          return extensions.file_icon(_, buffer)
        end
      )

      local segments = {
        extensions.mode,
        extensions.git_changes,
        file_icon
      }


      return segments
    end
    require('el').setup({ generator = generator })
  end
}
