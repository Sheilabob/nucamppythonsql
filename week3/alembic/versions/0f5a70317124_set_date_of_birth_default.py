"""set date_of_birth default

Revision ID: 0f5a70317124
Revises: cb4bf73bb888
Create Date: 2022-05-07 15:12:40.363708

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '0f5a70317124'
down_revision = 'cb4bf73bb888'
branch_labels = None
depends_on = None


def upgrade():
    op.execute(
        """
        ALTER TABLE customers
            ALTER COLUMN date_of_birth SET DEFAULT now();
        """
    )


def downgrade():
    op.execute(
        """
        ALTER TABLE customers
            ALTER COLUMN date_of_birth DROP DEFAULT;
        """
    )
