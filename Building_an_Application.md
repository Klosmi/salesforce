# Building an Application [

## [Data vs. Metadata](https://www.salesforceben.com/what-is-salesforce-metadata/#:~:text=How%20Does%20Metadata%20Differ%20From,data%20that%20describes%20other%20Data.)

__Data__ is the value of fields in the records
- Data is the values of fields on the record.

<br>

__Metadata__ contains the information about the look and feel of the application, along with its functionality.     
- Metadata can be accessed in code.   
- Metadata is different than data.
- Metadata can be stored on your file system.

The directory structure is broken into different types of metadata:   
- Apex Classes
- Custom Objects
- Permission Sets
- Triggers

[Source format](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_source_file_format.htm)



---

<br>

👈[back to contents](https://github.com/Klosmi/salesforce/blob/main/README.md#building-an-application)    
The structure of the metadata for the eg.: 'Crtification' ustom object contains:
 - one object-xml file in the main directory
 - subrectories for compactLayouts, fields, and listViews
 - many files in the fields subdirectory, representing individual fields

