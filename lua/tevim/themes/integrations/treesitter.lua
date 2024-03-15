local colors = require("tevim.themes").getCurrentTheme()
local utils = require("tevim.core.utils")

return {
	["@annotation"] = { fg = colors.base0F },
	["@attribute"] = { fg = colors.base0A },
	["@character"] = { fg = colors.base08 },
	["@constructor"] = { fg = colors.base0C },
	["@error"] = { fg = colors.base08 },
	["@definition"] = { sp = colors.base04, underline = true },
	["@scope"] = { bold = true },
	["@property"] = { fg = colors.base08 },
	["@operator"] = { fg = colors.base05 },
	["@symbol"] = { fg = colors.base0B },
	["@module"] = { fg = colors.base08 },
	["@reference"] = { fg = colors.base05 },

	["@function"] = { fg = colors.base0D },
	["@function.builtin"] = { fg = colors.base0D },
	["@function.macro"] = { fg = colors.base08 },
	["@function.call"] = { fg = colors.base0D },
	["@function.method"] = { fg = colors.base0D },
	["@function.method.call"] = { fg = colors.base0D },

	["@punctuation.bracket"] = { fg = colors.base0F },
	["@punctuation.delimiter"] = { fg = colors.base0F },

	["@constant"] = { fg = colors.base08 },
	["@constant.builtin"] = { fg = colors.base09 },
	["@constant.macro"] = { fg = colors.base08 },

	["@string"] = { fg = colors.base0B },
	["@string.regex"] = { fg = colors.base0C },
	["@string.escape"] = { fg = colors.base0C },

	["@tag"] = { fg = colors.base0A },
	["@tag.attribute"] = { fg = colors.base08 },
	["@tag.delimiter"] = { fg = colors.base0F },

	["@text"] = { fg = colors.base05 },
	["@text.emphasis"] = { fg = colors.base09 },
	["@text.strike"] = { fg = colors.base0F, strikethrough = true },
	["@string.special.url"] = { fg = colors.base09, underline = true },
	["@type.builtin"] = { fg = colors.base0A },
	["@number.float"] = { fg = colors.base09 },

	["@variable"] = { fg = colors.base09 },
	["@variable.builtin"] = { fg = colors.base09 },
	["@variable.member"] = { fg = colors.base08 },
	["@variable.member.key"] = { fg = colors.base08 },
	["@variable.parameter"] = { fg = colors.base08 },

	["@keyword"] = { fg = colors.base0E },
	["@keyword.function"] = { fg = colors.base0E },
	["@keyword.operator"] = { fg = colors.base0E },
	["@keyword.return"] = { fg = colors.base0E },
	["@keyword.exception"] = { fg = colors.base08 },
	["@keyword.import"] = { link = "Include" },
	["@keyword.conditional"] = { fg = colors.base0E },
	["@keyword.conditional.ternary"] = { fg = colors.base0E },
	["@keyword.repeat"] = { fg = colors.base0A },
	["@keyword.storage"] = { fg = colors.base0A },
	["@keyword.directive.define"] = { fg = colors.base0E },
	["@keyword.directive"] = { fg = colors.base0A },

	["@markup.heading"] = { fg = colors.base0D },
	["@markup.raw"] = { fg = colors.base09 },
	["@markup.link"] = { fg = colors.base08 },
	["@markup.link.url"] = { fg = colors.base09, underline = true },
	["@markup.link.label"] = { fg = colors.base0C },
	["@markup.list"] = { fg = colors.base08 },
	["@markup.strong"] = { bold = true },
	["@markup.italic"] = { italic = true },
	["@markup.quote"] = { bg = colors.lighter },
	["@markup.strikethrough"] = { strikethrough = true },

	["@comment"] = { link = "Comment" },
	["@comment.todo"] = { fg = utils.blend(colors.foreground, colors.background, 0.2), bg = colors.foreground },
	["@comment.warning"] = { fg = colors.lighter, bg = colors.base09 },
	["@comment.note"] = { fg = colors.lighter, bg = colors.foreground },
	["@comment.danger"] = { fg = colors.lighter, bg = colors.red },

	["@diff.plus"] = { fg = colors.green },
	["@diff.minus"] = { fg = colors.red },
	["@diff.delta"] = { fg = utils.blend(colors.foreground, colors.background, 0.2) },

	-- TreesitterContext
	TreesitterContext = { bg = colors.base01, bold = true },
	TreesitterContextBottom = { bold = true },
	TreesitterContextLineNumber = { fg = utils.blend(colors.foreground, colors.background, 0.2), bold = true },

	-- Rainbow Brackets
	RainbowDelimiterRed = { fg = colors.red },
	RainbowDelimiterYellow = { fg = utils.mix(colors.red, colors.green, 0.5) },
	RainbowDelimiterBlue = { fg = colors.blue },
	RainbowDelimiterOrange = { fg = utils.mix(colors.red, utils.mix(colors.red, colors.green, 0.5), 0.5) },
	RainbowDelimiterGreen = { fg = colors.green },
	RainbowDelimiterViolet = { fg = utils.mix(colors.red, colors.blue, 0.5) },
	RainbowDelimiterCyan = { fg = utils.mix(colors.foreground, colors.blue, 0.7) },
}
