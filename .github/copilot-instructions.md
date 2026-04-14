# Copilot Routing Instructions

## Objective
Use the project agents by default for task execution.

## Mandatory Routing Rules
- If the user requests a change, invoke the Builder agent first.
- If the user requests an error review and provides a specific error, invoke the Validator agent and pass that exact error text as input context.

## Trigger Phrases (English and Spanish)

Use these as examples of user intent; they are not strict-only matches.

### Route to Builder (change requests)
- EN: "make this change"
- EN: "implement this"
- EN: "add this feature"
- EN: "update this function"
- EN: "modify this file"
- EN: "refactor this"
- EN: "fix this behavior"
- EN: "apply these changes"
- ES: "haz este cambio"
- ES: "implementa esto"
- ES: "añade esta funcionalidad"
- ES: "actualiza esta función"
- ES: "modifica este archivo"
- ES: "refactoriza esto"
- ES: "arregla este comportamiento"
- ES: "aplica estos cambios"

### Route to Validator (specific error review)
- EN: "review this error: <error>"
- EN: "validate this error: <error>"
- EN: "check this exact error: <error>"
- EN: "debug this error: <error>"
- EN: "why does this error happen: <error>"
- ES: "revisa este error: <error>"
- ES: "valida este error: <error>"
- ES: "comprueba este error exacto: <error>"
- ES: "depura este error: <error>"
- ES: "por qué ocurre este error: <error>"

### Routing Clarifier
- If the user includes a concrete error string or message, prioritize Validator.
- If the user asks to change code/behavior, prioritize Builder.

## Validation Priority Rule
- When Validator is invoked with a specific error from the user, validate that error first, then continue with broader validation if needed.

## Handoff Rule
- Keep using the Builder -> Validator -> Fixer -> Validator -> Documenter loop as defined in project agents when a full implementation cycle is required.
