#!/bin/bash

function gencomp() {
    local input=$1
    local isDumb=false
    local createFiles=true
    usage() {
        echo "Usage: gencomp \$component-name [-d]"
    }
    # Parse Modifier Flags
    if [ $# -gt 1 ]; then
        if [ $2 == "-d" ]; then
            isDumb=true
        else
            createFiles=false
            usage;
        fi
    elif [ $1 == "-help" ]; then
        createFiles=false;
        usage;
    fi
    # Get word count (DONE)
    local wordCount=$(echo $1 | awk -F"-" '{print NF}')
    # parse words from input (DONE) Would like to try this with Arrays
    for (( i=1 ; ((i-wordCount-1)) ; i=(($i+1)) )); do
        eval "local word"$i"=$(echo $input | cut -d'-' -f ${i})";
    done;
    # generate different string variations (camel, snake, pascal..) (DONE)
    local camelName=""
    local pascalName=""
    local snakeName=$input

    toTitleCase() {
        echo $1 | awk '{print toupper(substr($0,0,1))tolower(substr($0,2))}'
    }
    # camelCase
    for ((i=1;((i-wordCount-1)) ; i=(($i+1)) )); do
        if [ $i == 1 ]; then
            camelName+=$(eval 'echo $word'${i})
        else
            camelName+=$(toTitleCase $(eval 'echo $word'${i}))
        fi
    done;

    # PascalCase
    for ((i=1;((i-wordCount-1)) ; i=(($i+1)) )); do
        pascalName+=$(toTitleCase $(eval 'echo $word'${i}))
    done;

    # Index ---------------------------------------------------------------------------------------
    writeIndex() {
        echo "export { "$pascalName" } from './"$snakeName".module';" > $snakeName/index.js;
    }
    # Module --------------------------------------------------------------------------------------
    writeModule() {
        echo "'use strict';

import { "$pascalName"Component } from './"$snakeName".component';
import './"$snakeName".scss';

export const "$pascalName"Module = angular
  .module('"$snakeName".drillview', [])
  .component('"$camelName"', "$pascalName")
  .name;" > $input/$input.module.js
    }
    # Component -----------------------------------------------------------------------------------
    writeSmartComp() {
        echo "import template from './"$snakeName".tpl.html';
import { "$pascalName"Controller } from './"$snakeName".controller';

export const "$pascalName"Component = {
  bindings: {},
  controller: "$pascalName"Controller,
  template: template
}" > $input/$input.component.js
    }

    writeDumbComp() {
        echo "import template from './"$camelName".tpl.html';

export const "$pascalName"Component = {
    bindings: {},
    template: template
}" > $input/$input.component.js
    }
    # HTML Template -------------------------------------------------------------------------------
    writeTemplate() {
        echo '<div class="'$snakeName'">
    '$pascalName'Component works!
</div>' > $input/$input.tpl.html
    }
    # Controller ----------------------------------------------------------------------------------
    writeController() {
        echo "'use strict'

class "$pascalName"Controller {}

export { "$pascalName"Controller };
" > $input/$input.controller.js
    }
    # make folder and populate files with text (DONE)
    if [ $isDumb == true ] && [ $createFiles == true ]; then
        mkdir $snakeName
        touch $snakeName/index.js $snakeName/$snakeName.{component.js,module.js,spec.js,tpl.html,scss}
        writeIndex
        writeModule
        writeDumbComp
        writeTemplate
    elif [ $isDumb == false ] && [ $createFiles == true ]; then
        mkdir $snakeName
        touch $snakeName/index.js $snakeName/$snakeName.{component.js,controller.js,module.js,spec.js,tpl.html,scss}
        writeIndex
        writeModule
        writeController
        writeSmartComp
        writeTemplate
    fi
}