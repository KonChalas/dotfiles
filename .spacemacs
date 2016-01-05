;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use.
   dotspacemacs-distribution 'spacemacs

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     (c-c++ :variables
            c-c++-enable-clang-support t
            c-c++-default-mode-for-headers 'c++-mode)
     (auto-completion :variables
            auto-completion-enable-snippets-in-popup t
            auto-completion-enable-help-tooltip t)
     emacs-lisp
     git
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     syntax-checking
     version-control
     gtags
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '()
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default

   dotspacemacs-editing-style 'vim

   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner.
   dotspacemacs-startup-banner nil

   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   dotspacemacs-startup-lists '(recents projects)

   ;; List of themes.
   dotspacemacs-themes '(solarized-dark
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         leuven
                         monokai
                         zenburn)

   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)

   ;; The leader key
   dotspacemacs-leader-key "SPC"

   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; The command key used for Evil commands. (ex-commands)
   dotspacemacs-command-key ":"

   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t

   ;; Location where to auto-save files.
   dotspacemacs-auto-save-file-location 'cache

   ;; If non nil then `ido' replaces `helm' for some commands.
   dotspacemacs-use-ido nil

   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil

   ;; if non nil, the helm header is hidden when there is only one source.
   dotspacemacs-helm-no-header nil

   ;; define the position to display `helm'.
   dotspacemacs-helm-position 'bottom

   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position.
   dotspacemacs-which-key-position 'bottom

   ;; If non nil a progress bar is displayed when spacemacs is loading.
   dotspacemacs-loading-progress-bar t

   ;; If non nil the frame is fullscreen when Emacs starts up.
   dotspacemacs-fullscreen-at-startup nil

   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non nil the frame is maximized when Emacs starts up.
   dotspacemacs-maximized-at-startup nil

   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols nil

   ;; If non nil smooth scrolling (native-scrolling) is enabled.
   dotspacemacs-smooth-scrolling t

   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil

   ;; Select a scope to highlight delimiters.
   dotspacemacs-highlight-delimiters 'all

   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")

   ;; The default package repository used if no explicit repository has been
   dotspacemacs-default-package-repository nil
   ))

(defun dotspacemacs/user-init ()
  )

(defun dotspacemacs/user-config ()
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; => General
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Enable auto-complete
  (add-hook 'prog-mode-hook 'company-mode)

  ;; Remove auto-completion delay
  (setq company-idle-delay 0)

  ;; Start auto-complete from first character
  (setq company-minimum-prefix-length 1)

  ;; Set to auto-write when you switch buffers, change widnow etc.
  (defadvice switch-to-buffer (before save-buffer-now activate)
    (when buffer-file-name (save-buffer)))
  (defadvice other-window (before other-window-now activate)
    (when buffer-file-name (save-buffer)))
  (defadvice other-frame (before other-frame-now activate)
    (when buffer-file-name (save-buffer)))
  (defadvice evil-window-left (before other-frame-now activate)
    (when buffer-file-name (save-buffer)))
  (defadvice evil-window-right (before other-frame-now activate)
    (when buffer-file-name (save-buffer)))
  (defadvice evil-window-up (before other-frame-now activate)
    (when buffer-file-name (save-buffer)))
  (defadvice evil-window-down (before other-frame-now activate)
    (when buffer-file-name (save-buffer)))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; => Emacs user interface
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Line numbers
  (add-hook 'prog-mode-hook #'linum-mode)
  (add-hook 'prog-mode-hook #'linum-relative-toggle)


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; => Colors and fonts
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; => Files, backups and undo
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Persistent undo
  (setq undo-tree-auto-save-history t
        undo-tree-history-directory-alist
        `(("." . ,(concat spacemacs-cache-directory "undo"))))
  (unless (file-exists-p (concat spacemacs-cache-directory "undo"))
    (make-directory (concat spacemacs-cache-directory "undo")))


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; => Text, tab and indent related
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Bind clang-format-buffer to tab on the c++-mode only:
  (add-hook 'c++-mode-hook
   (lambda ()
     (setq company-clang-arguments '("-std=c++11"))
     (setq flycheck-clang-language-standard "c++11")
  ))

  ;; syntax checking
  (setq flycheck-check-syntax-automatically '(mode-enabled save))

  ;; Bind clang-format-region to C-M-tab in all modes:
  (global-set-key [C-M-tab] 'clang-format-region)

  ;; Indent offset to 4 for C and C++
  (setq c-default-style "linux"
    c-basic-offset 4)

  ;; Set text width
  (setq-default fill-column 76)
  (add-hook 'prog-mode-hook (
   lambda ()
    (fci-mode 1)
  ))


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; => Moving around
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define-key evil-motion-state-map (kbd "C-e") (lambda (count) (interactive "p") (evil-scroll-line-down (* 3 count))))

  (define-key evil-motion-state-map (kbd "C-y") (lambda (count) (interactive "p") (evil-scroll-line-up (* 3 count))))

  ;; Remap VIM 0 to first non-blank character
  (define-key evil-normal-state-map (kbd "0") (kbd "^"))

  ;; Remap VIM $ to -
  (define-key evil-normal-state-map (kbd "-") (kbd "$"))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; => Powerline
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; => Editing mappings
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; => Misc
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common
   ((t
     (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection
   ((t
     (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(safe-local-variable-values (quote nil))
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
