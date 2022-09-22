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
}
