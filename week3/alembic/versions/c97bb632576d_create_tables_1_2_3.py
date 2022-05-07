"""create tables 1 2 3

Revision ID: c97bb632576d
Revises: 35260a82c4dc
Create Date: 2022-05-07 15:26:47.063657

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'c97bb632576d'
down_revision = '35260a82c4dc'
branch_labels = None
depends_on = None


def upgrade():
    op.execute(
        """
        CREATE TABLE table1(id SERIAL PRIMARY KEY);
        CREATE TABLE table2(id SERIAL PRIMARY KEY);
        CREATE TABLE table3(id SERIAL PRIMARY KEY);
        """
    )


def downgrade():
    op.execute(
        """
        DROP TABLE table3;
        DROP TABLE table2;
        DROP TABLE table1;
        """
    )
