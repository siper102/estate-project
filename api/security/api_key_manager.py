from functools import wraps

from database.database_manager import get_user_by_api_key
from fastapi import HTTPException, status
from fastapi.security import APIKeyHeader

api_key_header = APIKeyHeader(name="x-api-key")


def authorize(roles: list):
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            check_user_roles_by_api_key(api_key=kwargs["api_key"], roles=roles)
            return func(*args, **kwargs)

        return wrapper

    return decorator


def check_user_roles_by_api_key(api_key: str, roles: list):
    user = get_user_by_api_key(api_key)
    if user.role in roles:
        return
    raise HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="User does not have the right roles",
    )
