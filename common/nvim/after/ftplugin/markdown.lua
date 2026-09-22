vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.breakindent = true


-- LATEX MATH HIGHLIGHTING IN MARKDOWN ($$ ... $$ and $ ... $)
-- Block math: $$ ... $$ (spans one or many lines)
vim.cmd([[syntax region markdownMath start=/\$\$/ end=/\$\$/ keepend]])

-- Inline math: $ ... $ on a single line, e.g. $\forall x\in\mathbb R$
vim.cmd([[syntax match markdownMathInline /\$\@<!\$[^$]\{-1,}\$\$\@!/]])
