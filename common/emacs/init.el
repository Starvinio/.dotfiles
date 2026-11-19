;; init.el --- Emacs configuration -*- lexical-binding: t; -*-

;; ---------------------------------------------------------------------------
;; THE RULE FOR THIS FILE
;; This file (and custom.el) is edited ONLY in the Sunday 1h block. Any other
;; time it is read-only (chmod a-w). The point of the trial is to learn Emacs
;; as it is, not to tune it. Wanting to change something on a Tuesday is data:
;; write it in a notes file and decide on Sunday whether it was real friction.
;;
;; Trial started: 2026-11-21    Trial verdict date: 2026-12-31
;; ---------------------------------------------------------------------------

;; [added] Emacs 31 warns whenever it loads an .el file whose first line lacks
;; the "lexical-binding: t" cookie. The ones you see come from third-party
;; packages (evil 1.15.0's evil.el), not from your files: this file has the
;; cookie on line 1. It is harmless noise, and fixing it is upstream's job.
;; This hides only that one warning type, everywhere. Delete this line once
;; the packages you use ship fixed releases (or if you want to see it again).
;; Harmless on older Emacs versions: it just adds an entry to a list.
;; (require 'warnings) first: the variable does not exist until that library
;; is loaded, and touching it before then is an init error.
(require 'warnings)
(add-to-list 'warning-suppress-types '(files missing-lexbind-cookie))

;; [changed] Was a hardcoded path + load-file. locate-user-emacs-file follows
;; wherever this Emacs keeps its config (~/.config/emacs or ~/.emacs.d), so it
;; works unchanged on another machine. 'noerror stops a missing custom.el from
;; aborting the whole init on a fresh install.
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror 'nomessage)

(setopt ring-bell-function 'ignore)

;; get rid of the annoying backup files
(setq backup-directory-alist
      `(("." . ,(expand-file-name "backups/" user-emacs-directory))))

;; disable gui clutter

(setopt inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)

;; ido mode
(require 'ido)
(ido-mode 1)
(ido-everywhere 1)
;; [added] Without this, ido only matches contiguous substrings. With it,
;; typing letters in order matches non-contiguously ("lialg" finds
;; "Lineare-Algebra"). This is the file-navigation friction you named as the
;; reason for trying Emacs, so it shouldn't be handicapped by a default.
(setopt ido-enable-flex-matching t)

(setopt display-line-numbers-type 'relative)
(global-display-line-numbers-mode)
(setopt line-number-mode t)                        ; Show current line in modeline
(setopt column-number-mode t)                      ; Show column as well

;; font and theme
(add-to-list 'default-frame-alist `(font . "Iosevka-15"))
(load-theme 'modus-vivendi t)
(setq-default bidi-paragraph-direction 'left-to-right)
(setq bidi-inhibit-bpa t)


(windmove-default-keybindings 'control)

(setopt window-combination-resize t)

;; tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default fill-column 80)
(setopt sentence-end-double-space nil)

;; autopairs not used in nvim, might consider adding later
;; (electric-pair-mode 1)

;; compilation mode
(add-to-list 'display-buffer-alist
             '("\\*compilation\\*"
               (display-buffer-below-selected)
               (window-height . 0.5)))

(setq-default compilation-scroll-output t)

;; Mouse support
(when (display-graphic-p)
  (mouse-shift-adjust-mode)
  (context-menu-mode))


(use-package which-key
  :config
  (which-key-mode))


;; ===========================================================================
;; EVIL: the only package added. Everything else stays stock Emacs.
;; ===========================================================================
;; Evil gives you vi's modal editing inside Emacs. It does NOT replace Emacs's
;; commands: C-x b, C-x C-f, M-x, dired etc. all still exist and are what you
;; are here to learn. Escape hatch: C-z toggles "Emacs state", where every vi
;; key is off and you get pure Emacs. If evil ever fights a buffer, press C-z.
;;
;; Deliberately NOT installed (each would hide Emacs from you, which defeats
;; the trial): evil-collection (rebinds dozens of modes), a SPC leader key
;; (general.el / evil-leader), undo-tree, magit, vertico/consult. Revisit
;; them after the verdict, not during the trial.

;; Workaround for evil 1.15.0 / Emacs 31.
(defvar evil-mode-buffers '())

(use-package evil
  ;; Installs evil from NonGNU ELPA on first start (it is in Emacs's default
  ;; package-archives, so no MELPA setup is needed). It also pulls in goto-chg,
  ;; which evil needs for `g;', `g,' and the `.' register. On a new machine
  ;; this one line rebuilds the setup. First launch needs network, and it
  ;; writes to custom.el, so do it inside an unlocked Sunday block.
  :ensure t

  ;; :init runs BEFORE evil loads. evil-want-C-u-scroll genuinely must be set
  ;; here: evil reads it while building its keymaps, so setting it in :config
  ;; would silently do nothing. The other two would also work later, but all
  ;; evil options live together here so there is one place to look.
  :init
  ;; C-u scrolls up half a page, like vim. Default Emacs C-u is the universal
  ;; argument (C-u 4 ...); that still works in insert state and via M-1..M-9.
  (setopt evil-want-C-u-scroll t)
  ;; Y yanks to end of line (y$), matching Neovim's default since 0.6.
  ;; Evil's default is the older vi behaviour, where Y == yy.
  (setopt evil-want-Y-yank-to-eol t)
  ;; Real undo/redo (u and C-r) using Emacs's own built-in undo-redo (Emacs 28+).
  ;; This is what keeps the setup package-free: no undo-tree needed. Without
  ;; this evil falls back to plain Emacs undo and C-r has nothing to redo with.
  (setopt evil-undo-system 'undo-redo)

  :config
  (evil-mode 1))


;; ===========================================================================
;; MAGIT: git inside Emacs. Part of what the trial is testing.
;; ===========================================================================
;; Needs the `git' binary on PATH (you have it). Its dependencies (transient,
;; with-editor, magit-section, ...) are installed automatically.

(use-package magit
  ;; A bare (use-package magit) only CONFIGURES a package, it never installs
  ;; one. That is why it failed with "Cannot load magit". :ensure t installs
  ;; it from NonGNU ELPA on first start (needs network, and writes custom.el,
  ;; so do it in an unlocked Sunday block).
  :ensure t

  ;; C-x g is the key magit's own manual recommends, and it is unbound in
  ;; stock Emacs, so it collides with nothing. :bind also loads magit lazily,
  ;; on the first press, which keeps startup fast.
  :bind ("C-x g" . magit-status))

;; How magit and evil coexist, with no extra config: evil already starts
;; magit's buffers (status, log, diff, revision, process, refs, stash,
;; reflog, interactive rebase) in Emacs state, so magit's own keys work
;; as documented: s stage, u unstage, c commit, TAB expand, q quit, ? help.
;; Do not try to learn them as vim keys. Learn them as magit's, since
;; discovering them is part of the trial. Press ? for the full list.
;; Known gap: two rarely used list views (magit-repolist-mode and
;; magit-submodule-list-mode) start in normal state. Press C-z there to get
;; magit's own keys.
;;
;; Commit message buffers are ordinary text buffers: press i to type, then
;; C-c C-c to finish the commit or C-c C-k to abort.
