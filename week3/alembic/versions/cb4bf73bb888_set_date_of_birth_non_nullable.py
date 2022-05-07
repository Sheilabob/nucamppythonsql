"""set date_of_birth non_nullable

Revision ID: cb4bf73bb888
Revises: 3b20dea245a6
Create Date: 2022-05-07 15:07:54.101615

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'cb4bf73bb888'
down_revision = '3b20dea245a6'
branch_labels = None
depends_on = None


def upgrade():
    op.execute(
        """
        ALTER TABLE customers
            ALTER COLUMN date_of_birth SET NOT NULL;
        """
    )


def downgrade():
    op.execute(
        """
        ALTER TABLE customers
            ALTER COLUMN date_of_birth DROP NOT NULL;
        """
    )
