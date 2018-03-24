package com.dejans.${name?lower_case};

import java.util.ArrayList;
import java.util.List;
import com.dejans.model.DatabaseClassList;
import com.dejans.model.DatabaseClass;


public class ${className} implements DatabaseClassList<${objectOfList}> {
    private List<${objectOfList}> ${className?lower_case};

    private String[] xItems = {<#list items as item>"${item.item}"<#sep>,</#sep> </#list>};
    private String[] xType = {<#list items as item>"${item.type}"<#sep>,</#sep> </#list> };
    private String[] xPrimaryKey = {<#list primaryKeys as item>"${item.item}"<#sep>,</#sep> </#list>};
    private String[] xPrimaryKeyType = {<#list primaryKeys as item>"${item.type}"<#sep>,</#sep> </#list>};

    public ${className} () {
        ${className?lower_case} = new ArrayList<${objectOfList}>();
    }

    public List<${objectOfList}> get${className}() {
        return ${className?lower_case};
    }

    public void set${className}(List<${objectOfList}> ${className?lower_case}) {
        this.${className?lower_case} = ${className?lower_case};
    }

    public String typeClass() {
        return "List";
    }

    public List<${objectOfList}> getList() {
        return ${className?lower_case};
    }

    public String nameClass() {
        return "${className}";
    }

    public String nameClassBase() {
        return "${objectOfList}";
    }

    public String[] getxItems() {
        return xItems;
    }

    public String[] getxType() {
        return xType;
    }

    public String[] getxPrimaryKey() {
        return xPrimaryKey;
    }

    public String[] getxPrimaryKeyType() {
        return xPrimaryKeyType;
    }

    public DatabaseClass newObject() {
        return new ${objectOfList}();
    }

    public void add(Object obj) {
        ${className?lower_case}.add((${objectOfList}) obj);
    }
}
