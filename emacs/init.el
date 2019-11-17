
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b04425cc726711a6c91e8ebc20cf5a3927160681941e06bc7900a5a5bfe1a77f" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "7ef2884658a1fed818a11854c232511fa25721c60083a2695e6ea34ce14777ee" default)))
 '(helm-ag-base-command "/usr/local/bin/pt -e --nocolor --nogroup")
 '(org-agenda-files
   (quote
    ("/Users/mox/Dropbox/Desktop-lifehacker/documents/org/personal.org" "/Users/mox/Dropbox/Desktop-lifehacker/documents/org/work.org")))
 '(package-selected-packages
   (quote
    (centaur-tabs paredit parseedn bind-key treepy all-the-icons helm-org parinfer use-package drag-stuff paradox let-alist ob-restclient helm multiple-cursors idris-mode lv parseclj yasnippet hydra clj-refactor transient eyebrowse tablist sesman minimap eww-lnum pdf-tools exec-path-from-shell with-editor magit-popup avy which-key ghub dash async git-commit helm-core rich-minority powerline popup pkg-info ht flycheck epl clojure-mode ztree magit rainbow-mode csv-mode flycheck-ledger ledger-mode telephone-line smart-mode-line-powerline-theme smart-mode-line ox-epub ox-pandoc ox-twbs org-bullets org neotree helm-ag highlight-symbol rainbow-delimiters cider company ##)))
 '(paradox-github-token t)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; from http://fgiasson.com/blog/index.php/2016/06/14/my-optimal-gnu-emacs-settings-for-developing-clojure-revised/
;; Define packages archives repositories
(require 'package)

;; use-package https://github.com/jwiegley/use-package
;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  ;; (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))


;; centaur-tabs https://github.com/ema2159/centaur-tabs
(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))
(setq centaur-tabs-style "rounded")
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-set-bar 'over)
(setq centaur-tabs-set-modified-marker t)
(setq centaur-tabs-modified-marker "*")

;; parinfer https://github.com/DogLooksGood/parinfer-mode
;; TODO how to add hook on clojure/cider mode?
(use-package parinfer
  :ensure t
  :bind
  (("C-," . parinfer-toggle-mode))
  :init
  (progn
    (setq parinfer-extensions
          '(defaults       ; should be included.
            pretty-parens  ; different paren styles for different modes.
            evil           ; If you use Evil.
            lispy          ; If you use Lispy. With this extension, you should install Lispy and do not enable lispy-mode directly.
            paredit        ; Introduce some paredit commands.
            smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
            smart-yank))   ; Yank behavior depend on mode.
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    (add-hook 'common-lisp-mode-hook #'parinfer-mode)
    (add-hook 'scheme-mode-hook #'parinfer-mode)
    (add-hook 'lisp-mode-hook #'parinfer-mode)))


;; https://github.com/jtbm37/all-the-icons-dired
;; (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;;themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; load monokai theme
;;To load it automatically on Emacs startup add this to your init file:
(load-theme 'monokai t)

;; package archives
(add-to-list 'package-archives 
  '("marmalade" . "https://marmalade-repo.org/packages/"))  
(add-to-list 'package-archives 
  '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
  '("melpa-stable" . "https://stable.melpa.org/packages/") t)
; (add-to-list 'package-archives
;   '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))

;; Initialize all the ELPA packages (what is installed using the packages commands)    
(package-initialize)

;;;;; general
;; UTF-8 as default encoding
(set-language-environment "UTF-8")

;; Set the default comment column to 70
(setq-default comment-column 70)

;; mouse scrolling
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; exec path from shell https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; path https://sdqali.in/blog/2012/05/04/fixing-flyspell-for-emacs-in-mac-os-x/
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; add lein to executable path
(add-to-list 'exec-path "/Users/mox/Dati/shared_libraries/lein/")

;; sensible defaults https://github.com/hrs/sensible-defaults.el
(load-file "~/.emacs.d/sensible-defaults.el")
(sensible-defaults/reset-text-size)
(sensible-defaults/open-files-from-home-directory)
(sensible-defaults/treat-camelcase-as-separate-words)
(sensible-defaults/increase-gc-threshold)
(sensible-defaults/automatically-follow-symlinks)
(sensible-defaults/offer-to-create-parent-directories-on-save)
(sensible-defaults/show-matching-parens)
(sensible-defaults/ensure-that-files-end-with-newline)
(sensible-defaults/overwrite-selected-text)
(sensible-defaults/quiet-startup)
(sensible-defaults/make-dired-file-sizes-human-readable)
(sensible-defaults/shorten-yes-or-no)
(sensible-defaults/always-highlight-code)
;; (sensible-defaults/flash-screen-instead-of-ringing-bell)
(sensible-defaults/bind-commenting-and-uncommenting)
(sensible-defaults/bind-keys-to-change-text-size)

;;company mode
;; To use company-mode in all buffers, add the following line to your init file:
(add-hook 'after-init-hook 'global-company-mode)

;; flycheck https://www.flycheck.org/en/latest/user/quickstart.html
(add-hook 'after-init-hook #'global-flycheck-mode)

;; https://github.com/borkdude/flycheck-clj-kondo
(require 'flycheck-clj-kondo)

;; Show parenthesis mode
(show-paren-mode 1)

;; rainbow delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Configure helm-ag
;; Make sure to have Platinum Searcher installed: https://github.com/monochromegane/the_platinum_searcher
(global-set-key (kbd "M-s") 'helm-do-ag)

;; neotree https://github.com/jaypei/emacs-neotree
;; side bar
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; flyspell
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

;; org mode http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; org mode
;; pretty org-bullets https://github.com/sabof/org-bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-ellipsis "⤵")
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-src-window-setup 'current-window)
(add-hook 'org-mode-hook 'flyspell-mode)

(add-hook 'org-mode-hook #'(lambda ()
                             ;; make the lines in the buffer wrap around the edges of the screen.
                             ;; to press C-c q  or fill-paragraph ever again!
                             (visual-line-mode)
                             ;; (org-indent-mode)
                             ))

;; org mode agenda
(setq org-agenda-files (list "/Users/mox/Dropbox/Desktop-lifehacker/documents/org/personal.org"
                             "/Users/mox/Dropbox/Desktop-lifehacker/documents/org/work.org"))
;; org mode capture
(setq org-default-notes-file (concat org-directory "/Users/mox/Dropbox/Desktop-lifehacker/documents/org/notes.org"))

;; smart mode line
;; These two lines are just examples
;; (setq powerline-arrow-shape 'curve)
;; (setq powerline-default-separator-dir '(right . left))
;; These two lines you really need.
;; (setq sml/theme 'powerline)
;; (sml/setup)

(require 'telephone-line)
(setq telephone-line-height 20)
(setq telephone-line-lhs
      '((evil   . (telephone-line-evil-tag-segment))
        (accent . (telephone-line-vc-segment
                   telephone-line-erc-modified-channels-segment
                   telephone-line-process-segment))
        (nil    . (telephone-line-minor-mode-segment
                   telephone-line-buffer-segment))))
(setq telephone-line-rhs
      '((nil    . (telephone-line-misc-info-segment))
        (accent . (telephone-line-major-mode-segment))
        (evil   . (telephone-line-airline-position-segment))))
;; all config should happen before this
(telephone-line-mode 1)

;; https://github.com/hrs/dotfiles/blob/master/emacs/.emacs.d/configuration.org
;; exporting
(require 'ox-beamer)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; IDO
(ido-mode 1)
(setq ido-enable-flex-matching t)
;; IF you want Ido mode to work with C-x C-f (find-files) then add this as well:
(setq ido-everywhere t)

;; cider
;; pretty printing
(setq cider-repl-use-pretty-printing t)

;; always show line numbers
(global-linum-mode t)

;; Making Emacs Auto Indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; it makes C-n insert newlines if the point is at the end of the buffer.
(setq next-line-add-newlines t)

;; which-key
(require 'which-key)
(which-key-mode)
(which-key-setup-side-window-bottom)

;; window size
(add-to-list 'default-frame-alist '(height . 70))
(add-to-list 'default-frame-alist '(width . 140))

;; wider mode line
;;(custom-set-faces
;;  '(mode-line 
;;    ((t (:box (:line-width 4))))))

;; visual line mode default
(global-visual-line-mode 1)

;; https://github.com/clojure-emacs/clj-refactor.el
(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-r"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

;; due to https://github.com/pashky/restclient.el/issues/212
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; org babel restclient
(org-babel-do-load-languages
 'org-babel-load-languages
 '((restclient . t)))

;; drag stuff https://github.com/rejeep/drag-stuff.el
;; TODO enable only in non org non clojure
;; (drag-stuff-mode t)
;; (drag-stuff-global-mode 1)
;; (drag-stuff-define-keys)




;; Noninteractively upgrade all packages
;; https://emacs.stackexchange.com/questions/16398/noninteractively-upgrade-all-packages
(defun package-upgrade-all ()
  "Upgrade all packages automatically without showing *Packages* buffer."
  (interactive)
  (package-refresh-contents)
  (let (upgrades)
    (cl-flet ((get-version (name where)
                (let ((pkg (cadr (assq name where))))
                  (when pkg
                    (package-desc-version pkg)))))
      (dolist (package (mapcar #'car package-alist))
        (let ((in-archive (get-version package package-archive-contents)))
          (when (and in-archive
                     (version-list-< (get-version package package-alist)
                                     in-archive))
            (push (cadr (assq package package-archive-contents))
                  upgrades)))))
    (if upgrades
        (when (yes-or-no-p
               (message "Upgrade %d package%s (%s)? "
                        (length upgrades)
                        (if (= (length upgrades) 1) "" "s")
                        (mapconcat #'package-desc-full-name upgrades ", ")))
          (save-window-excursion
            (dolist (package-desc upgrades)
              (let ((old-package (cadr (assq (package-desc-name package-desc)
                                             package-alist))))
                (package-install package-desc)
                (package-delete  old-package)))))
      (message "All packages are up to date"))))

;; ligatures for fira code
;; https://github.com/tonsky/FiraCode/wiki/Emacs-instructions#using-composition-char-table

(when (window-system)
  (set-frame-font "Fira Code"))

(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))
