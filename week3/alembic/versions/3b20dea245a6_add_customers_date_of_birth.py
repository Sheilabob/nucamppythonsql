"""add customers date_of_birth

Revision ID: 3b20dea245a6
Revises: a9e68876028b
Create Date: 2022-05-07 14:59:44.088768

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '3b20dea245a6'
down_revision = 'a9e68876028b'
branch_labels = None
depends_on = None


def upgrade():
    op.execute(
        """
        ALTER TABLE customers
        ADD COLUMN date_of_birth TIMESTAMP;
        """
    )


def downgrade():
    op.execute(
        """
        ALTER TABLE customers
        DROP COLUMN date_of_birth;
        """
    )
