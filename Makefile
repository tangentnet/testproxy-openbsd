# $OpenBSD$

COMMENT =       Rust-based proxy for testing purposes

# Define the project's details
DISTNAME =      testproxy-0.0.5
CATEGORIES =    net

HOMEPAGE =      https://github.com/tangentnet/testproxy

MAINTAINER =    Tangent Networks <tangent.net@protonmail.com>

# Specify the license
PERMIT_PACKAGE = Yes

# Define GitHub variables
GH_ACCOUNT =    tangentnet
GH_PROJECT =    testproxy
GH_TAGNAME =    v0.0.5

# Specify the dependencies for building and running the project
MODULES =       lang/rust

# Use Cargo for building the project
CONFIGURE_STYLE = cargo

# Define any additional build and run dependencies
BUILD_DEPENDS = ${RUN_DEPENDS}
RUN_DEPENDS =

# Include the infrastructure to use Cargo
MODCARGO_CRATES =

pre-build:
	@echo "Current directory: $$(pwd)"
	@echo "Cargo version: $$(cargo --version)"


pre-configure:
	@echo "Starting pre-configure step"
	@echo "Current directory: $$(pwd)"

pre-build:
	@echo "Starting pre-build step"
	@echo "Current directory: $$(pwd)"
	@echo "Cargo version: $$(cargo --version)"

do-build:
	@echo "Starting do-build step"
	cd ${WRKSRC} && cargo build --release

post-build:
	@echo "Completed build step"

#do-install:
#	${INSTALL_PROGRAM} ${WRKSRC}/target/release/testproxy ${PREFIX}/bin
#	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/${DISTNAME}
#	${INSTALL_DATA} ${WRKSRC}/README.md ${PREFIX}/share/doc/${DISTNAME}

#do-install:
#	${INSTALL_PROGRAM} ${WRKSRC}/target/release/testproxy ${PREFIX}/bin
#	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/${DISTNAME}
#	${INSTALL_DATA} ${WRKSRC}/README.md ${PREFIX}/share/doc/${DISTNAME}

#do-package:
#	${RM} -r ${WRKINST}${PREFIX}/lib/rustlib
#	${RM} -r ${WRKINST}${PREFIX}/lib/rustup
#	${RM} -r ${WRKINST}${PREFIX}/share/doc/${DISTNAME}
#	${RM} -r ${WRKINST}${PREFIX}/share/examples/${DISTNAME}
#	${INSTALL_DATA_DIR} ${WRKINST}${PREFIX}/share/doc/${DISTNAME}
#	${INSTALL_DATA} ${WRKSRC}/README.md ${WRKINST}${PREFIX}/share/doc/${DISTNAME}

INSTALL =	doas

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/target/release/testproxy ${PREFIX}/bin
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/${DISTNAME}
	${INSTALL_DATA} ${WRKSRC}/README.md ${PREFIX}/share/doc/${DISTNAME}

# Package target
#do-package:
#	${INSTALL_DATA_DIR} ${PKGDIR}
#	${INSTALL_PROGRAM} ${WRKSRC}/target/release/testproxy ${PKGDIR}${PREFIX}/bin
#	${INSTALL_DATA} ${WRKSRC}/README.md ${PKGDIR}${PREFIX}/share/doc/${DISTNAME}

.include <bsd.port.mk>

