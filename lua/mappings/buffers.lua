local opts = { noremap = true, silent = true }
-- Go To Last Buffer
Mapper.map(
	"n",
	"<leader><tab>",
	":b#<CR>",
	opts,
	"Buffers",
	"buf_gotolast",
	"Go To Last Buffer"
)
-- Next Buffer
Mapper.map(
	"n",
	"<M-]>",
	":BufferNext<CR>",
	opts,
	"Buffers",
	"buf_next",
	"Next Buffer"
)
-- Previous Buffer
Mapper.map(
	"n",
	"<M-[>",
	":BufferPrevious<CR>",
	opts,
	"Buffers",
	"buf_prev",
	"Previous Buffer"
)
-- Previous Test Failure
Mapper.map(
	"n",
	"[t",
	"<Plug>(ultest-prev-fail)",
	opts,
	"Tests",
	"tests_prevfail",
	"Previous Test Failure"
)
-- Next Test Failure
Mapper.map(
	"n",
	"]t",
	"<Plug>(ultest-next-fail)",
	opts,
	"Tests",
	"tests_nextfail",
	"Next Test Failure"
)
-- Delete Buffer
Mapper.map(
	"n",
	"<leader><leader>db",
	":BufferDelete<CR>",
	opts,
	"Buffers",
	"buf_del",
	"Delete Buffer"
)
-- Pick Buffer
Mapper.map(
	"n",
	"<leader><leader>b",
	":BufferPick<CR>",
	opts,
	"Buffers",
	"buf_pick",
	"Pick Buffer"
)
-- Re-order Buffer Next
Mapper.map(
	"n",
	"<A->>",
	":BufferMoveNext<CR>",
	opts,
	"Buffers",
	"buf_movenext",
	"Re-order Buffer Next"
)
-- Re-order Buffer Previous
Mapper.map(
	"n",
	"<A-<>",
	":BufferMovePrevious<CR>",
	opts,
	"Buffers",
	"buf_moveprev",
	"Re-order Buffer Previous"
)
