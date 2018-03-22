package com.dejans.${name};

import java.time.LocalDate;


public class ${className} {
    <#list items as item>
    private ${item.type} ${item.item};
    private boolean ${item.item}defined;
    </#list>
    private ${className} OLD;
    private String status;

    public ${className}() {
      status = null;
    <#list items as item>
      ${item.item}defined = false;
    </#list>
    }

<#list items as item>    
    public ${item.type} get${item.item?cap_first}() {
        return ${item.item};
    }

    public void set${item.item?cap_first}(${item.type} ${item.item}) {
        if (!this.${item.item}defined) {
            this.${item.item} = ${item.item};
            this.${item.item}defined = true;
            return;
      }

    <#if item.type!="Integer">    
        if (this.${item.item} == null && ${item.item} == null)
            return;
        if (this.${item.item} != null && this.${item.item}.equals(${item.item}) && this.${item.item}defined)
            return;
    </#if>
    <#if item.type=="Integer">
        if (this.${item.item} == ${item.item})
            return;
    </#if>

        if (status != null && (status.equals("FU") || status.equals("U"))) {
            status = "U";
            if (!this.${item.item}defined) {
                this.${item.item} = ${item.item};
                this.${item.item}defined = true;
        } else {
    <#if item.type!="Integer">    
            if (this.${item.item} != null && this.${item.item}.equals(name))
                return;
    </#if>
    <#if item.type=="Integer">
            if (this.${item.item} == ${item.item})
              return;
    </#if>
            if (OLD == null) {
                OLD = new ${className}();
            }
            OLD.${item.item} = this.${item.item};
            OLD.${item.item}defined = true;
            this.${item.item} = ${item.item};

            }

        } else if (status == null || !status.equals("D")) {
            this.${item.item} = ${item.item};
            this.${item.item}defined = true;
        }
        // SR: for status D(elete) nije dozvoljena izmena
        return;
    }


</#list>

    public Pet getOLD() {
        return OLD;
    }

    public void setOLD(${className} oLD) {
        this.OLD = oLD;
        // only one level of OLD so we cancel OLD for OLD object
        this.OLD.OLD = null;
    }

    public String typeClass() {
        return "Object";
    }

    public String nameClass() {
        return "${className}";
    }

    public String getStatus() {
        if (OLD == null && status == null) {
            status = "I";
        }
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Object get(String itemName) {
        <#list items as item>if (itemName.equals("${item.item}")) {
            return ${item.item};
        }<#sep> else </#sep></#list>
        return null;
    }

    public void set(String itemName, Object value) {
        <#list items as item>if (itemName.equals("${item.item}")) {
            set${item.item?cap_first}((${item.type}) value);
        }<#sep> else </#sep></#list>
        return;
    }

    public boolean isChanged(String itemName) {
        if (OLD == null)
            return false;
        <#list items as item>if (itemName.equals("${item.item}")) {
            return OLD.${item.item}defined;
        }<#sep> else </#sep></#list>
        return false;
    }

    public Object getValueForPrimaryKey(String itemName) {
        <#list items as item>if (itemName.equals("${item.item}")) {
            if (OLD != null && OLD.${item.item}defined) {
                return OLD.${item.item};
            } else {
                return ${item.item};
            }
        }<#sep> else </#sep></#list>
        return null;
    }


}
