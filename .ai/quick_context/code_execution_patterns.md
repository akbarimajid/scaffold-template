# Code Execution Patterns

**Purpose:** Chain operations directly (reduce token bloat)  
**Last Updated:** 2025-12-05

## Pattern

**Bad:** Multiple tool calls, each result → LLM context (600 tokens)  
**Good:** Write code that chains, execute in sandbox (0 tokens in context)

## Examples

**Chain Operations:**
```python
def workflow():
    result1 = function1()
    result2 = function2(result1)
    return result2
```

**Batch Checks:**
```python
def validation_checks():
    return all([check_auth(), check_permissions(), check_limits()])
```

**Data Processing:**
```python
def process_data_workflow(input_data):
    if not validate_input(input_data):
        return {"error": "Invalid input"}
    cleaned = clean_data(input_data)
    processed = transform_data(cleaned)
    result = save_data(processed)
    return {"status": "success", "id": result}
```

## When to Use

✅ Multi-step workflows  
✅ Data transformation chains  
✅ Batch operations  
❌ Single simple operations (tool call fine)

## Token Savings

**Example:** Data processing workflow
- Before: 4 tool calls × 200 tokens = 800 tokens
- After: Code execution = 0 tokens in context
- Savings: 800 tokens (100%)

