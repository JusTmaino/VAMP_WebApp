

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'vamp_webapp.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'vamp_webapp.UserRole'
grails.plugin.springsecurity.authority.className = 'vamp_webapp.Role'
grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/'
grails.plugin.springsecurity.successHandler.alwaysUseDefault = true
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.logout.afterLogoutUrl = '/login/auth'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['ROLE_USER', 'ROLE_ADMIN']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['ROLE_USER', 'ROLE_ADMIN']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']],
	[pattern: '/user/**', access: ['ROLE_USER', 'ROLE_ADMIN']],
	[pattern: '/user/index/**', access: ['ROLE_ADMIN']],
	[pattern: '/user/register', access: ['permitAll']],
	[pattern: '/role/**', access: ['ROLE_ADMIN']],
	[pattern: '/userRole/**', access: ['ROLE_ADMIN']],
	[pattern: '/car/index/**', access: ['ROLE_ADMIN']],
	[pattern: '/car/**', access: ['permitAll']],
	[pattern: '/location/**', access: ['permitAll']],
	[pattern: '/media/**', access: ['permitAll']],
	[pattern: '/playList/**', access: ['permitAll']],
	[pattern: '/profile/**', access: ['permitAll']],
	[pattern: '/setting/**', access: ['permitAll']]


]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

