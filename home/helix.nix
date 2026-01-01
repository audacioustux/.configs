{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    # Custom theme to fix bufferline underline
    themes.catppuccin_custom = {
      inherits = "catppuccin_mocha";
      "ui.bufferline.active" = { fg = "lavender"; bg = "surface0"; modifiers = ["bold"]; };
      "ui.bufferline" = { fg = "subtext0"; bg = "mantle"; };
    };

    settings = {
      theme = "catppuccin_custom";

      editor = {
        line-number = "relative";
        cursorline = true;
        auto-save.focus-lost = true;
        mouse = true;
        scrolloff = 8;
        completion-trigger-len = 1;
        bufferline = "multiple";
        popup-border = "all";
        true-color = true;

        statusline = {
          left = ["mode" "spinner" "spacer" "file-name" "file-modification-indicator"];
          center = ["diagnostics"];
          right = ["selections" "position" "file-type"];
          mode = { normal = "NOR"; insert = "INS"; select = "SEL"; };
        };

        indent-guides = { render = true; character = "▏"; };
        cursor-shape = { normal = "block"; insert = "bar"; select = "underline"; };
        file-picker.hidden = false;

        lsp = {
          display-inlay-hints = true;
          auto-signature-help = true;
        };

        inline-diagnostics.cursor-line = "hint";
      };

      keys = {
        normal = {
          "C-s" = ":write";
          "C-q" = ":quit";
          tab = "goto_next_buffer";
          S-tab = "goto_previous_buffer";
          "C-/" = "toggle_comments";
          esc = ["collapse_selection" "keep_primary_selection"];
          U = "redo";

          # Window navigation (Ctrl+hjkl)
          "C-h" = "jump_view_left";
          "C-j" = "jump_view_down";
          "C-k" = "jump_view_up";
          "C-l" = "jump_view_right";

          space = {
            f = { f = "file_picker"; g = "global_search"; s = ":write"; };
            b = { b = "buffer_picker"; d = ":buffer-close"; o = ":buffer-close-others"; };
            w = {
              s = "hsplit"; v = "vsplit"; q = ":quit";
              h = "jump_view_left"; j = "jump_view_down"; k = "jump_view_up"; l = "jump_view_right";
            };
            l = { a = "code_action"; r = "rename_symbol"; f = ":format"; d = "goto_definition"; };
            d = { d = "goto_next_diag"; D = "goto_prev_diag"; l = "diagnostics_picker"; };
            g = { g = ":sh lazygit"; };
            y = "yank_to_clipboard";
            p = "paste_clipboard_after";
            k = "hover";
          };

          # Brackets navigation
          "]" = { d = "goto_next_diag"; g = "goto_next_change"; f = "goto_next_function"; };
          "[" = { d = "goto_prev_diag"; g = "goto_prev_change"; f = "goto_prev_function"; };
        };

        insert = {
          j = { k = "normal_mode"; };
          "C-s" = ":write";
          "C-space" = "completion";
        };
      };
    };

    languages = {
      language-server = {
        nil.command = "nil";
        rust-analyzer.command = "rust-analyzer";
        typescript-language-server = { command = "typescript-language-server"; args = ["--stdio"]; };
        pyright = { command = "pyright-langserver"; args = ["--stdio"]; };
      };

      language = [
        { name = "nix"; auto-format = true; formatter.command = "nixfmt"; }
        { name = "rust"; auto-format = true; }
        { name = "typescript"; auto-format = true; formatter = { command = "prettier"; args = ["--parser" "typescript"]; }; }
        { name = "javascript"; auto-format = true; formatter = { command = "prettier"; args = ["--parser" "babel"]; }; }
        { name = "python"; auto-format = true; formatter = { command = "ruff"; args = ["format" "-"]; }; }
        { name = "json"; auto-format = true; formatter = { command = "prettier"; args = ["--parser" "json"]; }; }
        { name = "markdown"; soft-wrap.enable = true; }
      ];
    };
  };
}
