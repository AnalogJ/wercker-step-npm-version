if [ -z "$WERCKER_NPM_VERSION_TYPE"  ]; then
    export WERCKER_NPM_VERSION_TYPE="patch";
fi

npm version $WERCKER_NPM_VERSION_TYPE -m "$WERCKER_NPM_VERSION_MESSAGE"