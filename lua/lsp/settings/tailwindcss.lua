local lspconfig = require'lspconfig'

return {
	settings = {
		tailwindCSS = {
			validate = true,
			lint = {
				cssConflict = 'warning',
				invalidApply = 'error',
				invalidScreen = 'error',
				invalidVariant = 'error',
				invalidConfigPath = 'error',
				invalidTailwindDirective = 'error',
				recommendedVariantOrder = 'warning',
			},
			classAttributes = {
				'style',
				'tw',
				"class", "className", "classList", "ngClass"
			},
		},
	},

	root_dir = lspconfig.util.root_pattern('tailwind.config.cjs','tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.ts')
}
