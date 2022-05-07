"""drop fk_orders_customers

Revision ID: 35260a82c4dc
Revises: b743dfb4a759
Create Date: 2022-05-07 15:24:03.853568

"""
from collections import _OrderedDictKeysView
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '35260a82c4dc'
down_revision = 'b743dfb4a759'
branch_labels = None
depends_on = None


def upgrade():
    op.execute(
        """
        ALTER TABLE orders
            DROP CONSTRAINT fk_orders_customers;
        """
    )


def downgrade():
    op.execute(
        """
        ALTER TABLE orders
        ADD CONSTRAINT fk_orders_customers
        FOREIGN KEY (customer_id)
        REFERENCES customers(id)
        ON DELETE CASCADE;
        """
    )
