   DataDir = "data/"
    sqlType = "mysql"
    
	sqlHost = "127.0.0.1"
	sqlPort = 3306
	sqlUser = "root"
	sqlPass = ""
	sqlDatabase = "ots"
	sqlKeepAlive = 0
	mysqlReadTimeout = 100
	mysqlWriteTimeout = 100
	mysqlReconnectionAttempts = 3
	encryptionType = "sha1"
	howmanymc = 30
	
	accountManager = false
	namelockManager = false
	newPlayerChooseVoc = false
	newPlayerSpawnPosX = 857
	newPlayerSpawnPosY = 964
	newPlayerSpawnPosZ = 7
	newPlayerTownId = 12
	newPlayerLevel = 1
	newPlayerMagicLevel = 0
	generateAccountNumber = false
	generateAccountSalt = false

	useRookSystem = true
	rookTownId = 12
	rookLevelToGetRooked = 5
	rookLevelToLeaveRook = 8
	speedup = 2

	useFragHandler = true
	redSkullLength = 3 * 24 * 60 * 60
	fragsLimit = 24 * 60 * 60
	fragsSecondLimit = 3 * 24 * 60 * 60
	fragsThirdLimit = 7 * 24 * 60 * 60
	advancedFragList = false
	broadcastBanishments = true
	autoBanishUnknownBytes = false
	TimeToDecreaseFrags = 6 * 60 * 60 * 1000
	KillsToRedSkull = 6
	KillsToBan = 10
	BanLengthUnjust = 2 * 24 * 60 * 60
	WarningsToFinalBanUnjust = 3
	FinalBanLengthUnjust = 1 * 24 * 60 * 60
	
	notationsToBan = 3
	warningsToFinalBan = 4
	warningsToDeletion = 5
	banLength = 7 * 24 * 60 * 60
	killsBanLength = 7 * 24 * 60 * 60
	finalBanLength = 7 * 24 * 60 * 60
	ipBanLength = 1 * 24 * 60 * 60
	allowedMaxSizePackets = 50

	worldType = "open"
	protectionLevel = 8
	pvpTileIgnoreLevelAndVocationProtection = true
	pzLocked = 60 * 1000
	huntingDuration = 60 * 1000
	criticalHitChance = 7
	criticalHitMultiplier = 1
	displayCriticalHitNotify = false
	removeWeaponAmmunition = true
	removeWeaponCharges = true
	removeRuneCharges = true
	whiteSkullTime = 5 * 60 * 1000
	noDamageToSameLookfeet = false
	showHealthChange = true
	showManaChange = true
	showHealthChangeForMonsters = false
	showManaChangeForMonsters = false
	fieldOwnershipDuration = 5 * 1000
	stopAttackingAtExit = false
	deathLostPercent = 25
	pushCreatureDelay = 1 * 1000
	deathContainerId = 1987
	gainExperienceColor = 215
	addManaSpentInPvPZone = false
	recoverManaAfterDeathInPvPZone = false
	squareColor = 0
	allowFightback = false
	fistBaseAttack = 5
	useFairfightReduction = false
	optionalWarAttackableAlly = false

	worldId = 0
	ip = "89.101.103.41"
	useProxyServer = false
	usProxyIp = "84.203.25.227"
	brProxyIp = "84.203.25.227"
	bindOnlyGlobalAddress = false
	loginPort = 7171
	gamePort = 7172
	loginTries = 10
	retryTimeout = 5 * 1000
	loginTimeout = 60 * 1000
	maxPlayers = 2000
	motd = "Welcome!"
	displayOnOrOffAtCharlist = true
	charlistBasicInfo = true
	onePlayerOnlinePerAccount = false
	allowClones = 0
	serverName = "COMPETITIBIA"
	serverProxyName = "Proxy US"
	loginMessage = "Welcome to the  Competitibia Make sure to join our discord https://discord.gg/pg2d95uqsH !"
	statusTimeout = 5 * 60 * 1000
	replaceKickOnLogin = true
	forceSlowConnectionsToDisconnect = false
	loginOnlyWithLoginServer = false
	premiumPlayerSkipWaitList = false
	packetsPerSecond = 50
	

	deathListEnabled = true
	deathListRequiredTime = 1 * 60 * 1000
	deathAssistCount = 0
	maxDeathRecords = 5
	multipleNames = false

	externalGuildWarsManagement = true
	ingameGuildManagement = false
	levelToFormGuild = 8
	premiumDaysToFormGuild = 0
	guildNameMinLength = 4
	guildNameMaxLength = 20

	buyableAndSellableHouses = true
	houseNeedPremium = false
	bedsRequirePremium = false
	levelToBuyHouse = 30
	housesPerAccount = 2
	houseRentAsPrice = false
	housePriceAsRent = false
	housePriceEachSquare = 2000
	houseSkipInitialRent = true
	houseRentPeriod = "none"
	houseCleanOld = 365
	guildHalls = false
	houseProtection = true
	enableCast = false

	timeBetweenActions = 500
	timeBetweenExActions = 1000
	timeBetweenCustomActions = 1000
	hotkeyAimbotEnabled = false
	tibiaClassicSlots = true

	mapName = "world.otbm"
	mapAuthor = "x"
	randomizeTiles = true
	storeTrash = true
	cleanProtectedZones = true

	mailboxDisabledTowns = "12"
	mailMaxAttempts = 20
	mailBlockPeriod = 60 * 60 * 1000
	mailAttemptsFadeTime = 10 * 60 * 1000

	daemonize = false
	defaultPriority = "high"
	niceLevel = 5
	serviceThreads = 4
	coresUsed = "-1"

	startupDatabaseOptimization = false
	updatePremiumStateAtStartup = true
	skipItemsVersionCheck = false

	bufferMutedOnSpellFailure = false
	spellNameInsteadOfWords = false
	emoteSpells = false
	unifiedSpells = false
	runesHitTopCreature = false
	allowChangeOutfit = true
	allowChangeColors = true
	disableOutfitsForPrivilegedPlayers = false

	dataDirectory = "data/"
	logsDirectory = "data/logs/"
	bankSystem = true
	promptExceptionTracerErrorBox = true
	maximumDoorLevel = 500
	maxMessageBuffer = 10
	logPlayersStatements = true
	tradeLimit = 100
	useCapacity = true
	tileHeightBlock = true
	autoStack = true
	playerFollowExhaust = 500

	-- Party
	-- NOTE: experienceShareLevelDifference is float number.
	-- experienceShareLevelDifference is highestLevel * value
	experienceShareRadiusX = 60
	experienceShareRadiusY = 60
	experienceShareRadiusZ = 3
	experienceShareLevelDifference = 2 / 3
	extraPartyExperienceLimit = 200
	extraPartyExperiencePercent = 25
	experienceShareActivity = 2 * 60 * 1000
	
	
	defaultDepotSizePremium = 2000
	defaultDepotSize = 1000

	separateVipListPerCharacter = false
	vipListDefaultLimit = 20
	vipListDefaultPremiumLimit = 100

	houseDataStorage = "binary"
	saveGlobalStorage = true
	storePlayerDirection = true
	savePlayerData = true

	ghostModeInvisibleEffect = false
	ghostModeSpellEffects = false

	idleWarningTime = 14 * 60 * 1000
	idleKickTime = 15 * 60 * 1000
	reportsExpirationAfterReads = 1
	playerQueryDeepness = -1
	tileLimit = 1000
	protectionTileLimit = 1000
	houseTileLimit = 1000

	freePremium = true
	premiumForPromotion = false

	blessings = false
	blessingOnlyPremium = false
	blessingReductionBase = 0
	blessingReductionDecrement = 0
	eachBlessReduction = 0
	pvpBlessingThreshold = 0
	fairFightTimeRange = 0

	experienceStages = true
	rateExperience = 1.0
	rateExperienceFromPlayers = 1.5
	rateSkill = 20.0
	rateMagic = 4.0*5
	rateLoot = 5.0
	monsterLootMessage = 0
	offlineRateSkill = 0.2
	offlineRateMagic = 0.2
	rateSpawn = 1
	rateSpawnMin = 1
	rateSpawnMax = 1

	
	rateMonsterHealth = 1.0
	rateMonsterMana = 1.0
	rateMonsterAttack = 1.0
	rateMonsterDefense = 1.0

	minLevelThresholdForKilledPlayer = 0.5
	maxLevelThresholdForKilledPlayer = 1.5

	useStamina = false
	rateStaminaLoss = 1
	rateStaminaGain = 3
	rateStaminaThresholdGain = 12
	staminaRatingLimitTop = 40 * 60
	staminaRatingLimitBottom = 14 * 60
	staminaLootLimit = 14 * 60
	rateStaminaAboveNormal = 1.5
	rateStaminaUnderNormal = 0.5
	staminaThresholdOnlyPremium = true
	globalSaveEnabled = true
	globalSaveHour = 6
	globalSaveMinute = 00
	shutdownAtGlobalSave = true
	cleanMapAtGlobalSave = true
	closeInstanceOnShutdown = true

	deSpawnRange = 30
	deSpawnRadius = 30
	monsterSpawnWalkback = false
	allowBlockSpawn = true

	maxPlayerSummons = 2
	summonsDropCorpse = true
	teleportAllSummons = false
	teleportPlayerSummons = false

	statusPort = 7171
	ownerName = "XSOFT"
	ownerEmail = "x@gmail.com"
	url = "x"
	location = "Europe"
	displayGamemastersWithOnlineCommand = false

	disableLuaErrors = false
	displayPlayersLogging = true
	prefixChannelLogs = ""
	runFile = ""
	outputLog = ""
	truncateLogOnStartup = false
	
