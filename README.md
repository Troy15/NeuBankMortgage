# Neubank Mortgage


## Coding exercise for Neubank infrastructure
Terraform code for deploying resources for Neubank's Mortgage Calculator in Azure

Created modules for resources, using a separate module for each resource with two eceptions:
** AppService module contains AppService Plan as well
** vNet module also contains subnet creation


## Template Execution
Very basic deployment via GitHub actions. YML file available for review in .github/workflows directory. 


## Workitems can be found on the project's [Azure DevOps Boards](https://dev.azure.com/neubank/MortgageCalculator/_workitems)
I broke the tasks into two Epics - Determining Requirements and Infrastucture Build. 

I felt there were some pieces of information that would be needed in a real-world build I created stories for them under the Determing Requirements epic. For a DEV environment some of these might be overkill, but they would be conversations I would normally have with a client, so I wanted to include them here. 

The Infrastructure Build is what you'd expect, though these stories could be revised or additional stories created depending on the outcome of the requirement gathering in the other epic. 


## Architectural Design 
![Design Diagram](./diagrams/NeuBank%20Mortgage%20-%20Azure%20Infrastructure.drawio.png)


## License
This project is licensed under the [MIT License](./LICENSE).


## Terraform Installation
To install Terraform, follow these steps:

1. Download the appropriate Terraform package for your operating system from the [Terraform website](https://www.terraform.io/downloads.html).
2. Extract the downloaded package to a directory of your choice.
3. Add the directory containing the Terraform executable to your system's PATH environment variable.
4. Open a terminal or command prompt and run `terraform --version` to verify the installation.

For more detailed instructions, refer to the [Terraform documentation](https://learn.hashicorp.com/tutorials/terraform/install-cli).