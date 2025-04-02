local jdtls_dir = "/home/kx/sws/jdt-language-server-1.40.0-202409261450"
local java_home = "/usr/lib/jvm/java-21-openjdk"

-- Auto-detect OS config
local os_config = "config_linux"

-- Find project root
local root_markers = { ".git", "build.gradle", "pom.xml", "settings.gradle", "gradlew", "mvnw" }
local root_dir = require("jdtls.setup").find_root(root_markers) or vim.fn.getcwd()
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls_workspace/" .. project_name
vim.fn.mkdir(workspace_dir, "p")

local config = {
	cmd = {
		java_home .. "/bin/java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		-- JDTLS specific arguments
		"-jar",
		vim.fn.glob(jdtls_dir .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
		"-configuration",
		jdtls_dir .. "/" .. os_config,
		"-data",
		workspace_dir,
	},

	root_dir = root_dir,
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-21",
						path = java_home,
					},
				},
			},
			import = {
				gradle = {
					enabled = true,
					wrapper = {
						enabled = true,
					},
				},
				maven = {
					enabled = true,
				},
			},
			referencesCodeLens = {
				enabled = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			format = {
				enabled = true,
			},
		},
	},
	filetypes = { "java" },
	flags = {
		allow_incremental_sync = true,
	},
	init_options = {
		bundles = {},
		extendedClientCapabilities = {
			progressReportProvider = true,
			classFileContentsSupport = true,
			generateToStringPromptSupport = true,
			hashCodeEqualsPromptSupport = true,
		},
	},
}

-- Start JDTLS
require("jdtls").start_or_attach(config)
