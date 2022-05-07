"""rename date_of_birth to dob

Revision ID: 600e3a5b5cf5
Revises: 0f5a70317124
Create Date: 2022-05-07 15:17:30.031895

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '600e3a5b5cf5'
down_revision = '0f5a70317124'
branch_labels = None
depends_on = None


def upgrade():
    op.execute(
        """
        ALTER TABLE customers
            RENAME COLUMN date_of_birth TO dob;
        """
    )


def downgrade():
    op.execute(
        """
        ALTER TABLE customers
            RENAME COLUMN dob TO date_of_birth;
        """
    )
