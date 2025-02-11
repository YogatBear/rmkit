OUTDIR=artifacts
PACKAGE="${1}"
TARGET=${TARGET:-rm}
mkdir ${OUTDIR}
docker run -i --rm -v "${PWD}/${OUTDIR}:/mnt/artifacts" rmkit /bin/bash << COMMANDS
mkdir -p src/build
TARGET=${TARGET} make ${PACKAGE}
mkdir -p /mnt/artifacts/${TARGET}/
cp -r src/build/* /mnt/artifacts/${TARGET}/
chown -R $(id -u):$(id -u) /mnt/artifacts
COMMANDS

