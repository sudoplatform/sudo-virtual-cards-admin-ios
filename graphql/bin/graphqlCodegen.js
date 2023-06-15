#!/usr/bin/env node

const { execSync } = require("child_process");
const fs = require("fs");
const os = require("os");
const path = require("path");

const outputFolderPath = "../SudoVirtualCardsAdmin/API";

const { argv } = require("yargs")
  .scriptName(path.basename(__filename))
  .usage("Usage $0 -d string -o string")
  .option("d", {
    alias: "documentPath",
    describe: "Path to the graphql documents to generate API.",
    default: "documents/**/*.graphql",
    type: "string",
    nargs: 1,
  })
  .option("o", {
    alias: "outputPath",
    describe: "Path to output the generated swift file.",
    default: `${outputFolderPath}/SudoVirtualCardsAdminAPI.swift`,
    type: "string",
    nargs: 1,
  });

const documentsPattern = argv.d;
const apiFile = argv.o;

const schemaFile = "introspection.json";
const disableSwiftLintRule = "// swiftlint:disable all";

/*******************************************************************************
 * Main
 ******************************************************************************/

// Run initial code generation to generate the introspection file
try {
  execSync("graphql-codegen -c codegen.yml");
} catch (err) {
  console.log("graphql-codegen -c codegen.yml failed", { err });
  process.exit(1);
}

// Create output folder if it doesn't already exist.
if (!fs.existsSync(outputFolderPath)) {
    fs.mkdirSync(outputFolderPath);
}

// Move the introspection file to a tmp directory
const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), "graphql-codegen"));
const schemaPath = path.join(tmpDir, schemaFile);
fs.renameSync(schemaFile, schemaPath);

// Run the swift code generation.
try {
  execSync(
    `aws-appsync-codegen generate ${documentsPattern} --schema ${schemaPath} --output ${apiFile}`
  );
} catch (err) {
  console.log("aws-appsync-codegen generate failed", { err });
  process.exit(1);
}

// Load the file as a string
let fileAsString = fs.readFileSync(apiFile, "utf-8");

// Add swiftlint disable rule
fileAsString = `${disableSwiftLintRule}\n${fileAsString}`;

fileAsString = fileAsString
  // Replace all public with internal
  .replace(/\bpublic\b/g, "internal")
  // Add wrapping GraphQL struct to namespace
  .replace("import AWSAppSync\n", "import AWSAppSync\n\nstruct GraphQL {\n")
  .concat("\n}");

// Write updated string back to file
fs.writeFileSync(apiFile, fileAsString, "utf-8");
