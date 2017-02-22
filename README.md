# exceedra.engineering OAuth Setup

Quick guide to set up Azure Active Directory OAuth login for Jekyll app.

## Azure Setup

1. Sign in to https://portal.azure.com
2. Register app by going to Azure Active Directory > App registrations > Add
3. Save App Secret!
4. Add Reply URL `<HOMEPAGE>/auth/azure_oauth2/callback`
5. Copy Application ID and Tenant ID. Tenant ID can be found by clicking Help > Run Diagnostics

## .env Setup

1. Create .env file to hold environmental variables in project root
2. Add App ID, Secret and Tenant ID as plain text i.e. not strings
```
AZURE_CLIENT_ID=<APP_ID>
AZURE_CLIENT_SECRET=<APP_SECRET>
AZURE_TENANT_ID=<TENANT_ID>
```

## Run

```
>> bundle               # sort out any gem version conflicts
>> jekyll serve         # generate pages
>> ruby app.rb          # run ruby application

```
