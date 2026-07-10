# Installation

1. Install the Tmux Plugin Manager (TPM):

   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

2. Reload the tmux configuration:

   ```bash
   tmux source-file ~/.config/tmux/tmux.conf
   ```

   If you're not already in a tmux session, start one first:

   ```bash
   tmux
   ```

3. Install the configured plugins by pressing:

   ```text
   Prefix + I
   ```

   (`I` is a capital **I**.)
