# api/config.py

from pydantic import Field
from pydantic_settings import BaseSettings, SettingsConfigDict
from dotenv import load_dotenv

load_dotenv()


class Settings(BaseSettings):
    DATABASE_URI: str = "sqlite:///./autogen0404.db"
    API_DOCS: bool = False
    CLEANUP_INTERVAL: int = 300  # 5 minutes
    SESSION_TIMEOUT: int = 3600  # 1 hour
    CONFIG_DIR: str = "configs"  # Default config directory relative to app_root
    DEFAULT_USER_ID: str = "guestuser@gmail.com"
    UPGRADE_DATABASE: bool = False
    ALLOWED_IPS: list = Field(default_factory=list)

    model_config = SettingsConfigDict(
        env_prefix="AUTOGENSTUDIO_", extra="ignore")


settings = Settings()
