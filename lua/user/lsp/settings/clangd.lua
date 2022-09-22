return {
	cmd = {
		'clangd',
		'--background-index',
		'--suggest-missing-includes',
		'--clang-tidy',
		'--header-insertion=iwyu',
	},
	filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
}
