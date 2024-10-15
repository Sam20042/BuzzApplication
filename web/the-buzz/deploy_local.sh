# local deploy script for the web front-end

# This file is responsible for preprocessing all TypeScript files, making sure
# all dependencies are up-to-date, and copying all necessary files into a
# local web deploy directory, and starting a web server

# This is the resource folder we will use as the web root
TARGETFOLDER=./target

# step 1: make sure we have someplace to put everything.  We will delete the
#         old folder, and then make it from scratch
echo "Deleting and recreating $TARGETFOLDER"
rm -rf $TARGETFOLDER
mkdir $TARGETFOLDER

# step 2: update our npm dependencies
echo "Updating node dependencies"
npm update

# step 3: copy static html, css, and JavaScript files
echo "Copying static html, css, and js files"
cp -r src $TARGETFOLDER
cp -r public $TARGETFOLDER

# step final: launch the server.  Be sure to disable caching
# (Note: we don't currently use -s for silent operation)
echo "Starting local webserver at $TARGETFOLDER"
npm start $TARGETFOLDER