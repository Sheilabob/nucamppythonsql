"""empty message

Revision ID: 91ee46dda346
Revises: 9663e234bc72
Create Date: 2022-05-20 19:01:07.222769

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '91ee46dda346'
down_revision = '9663e234bc72'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('background_info',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('original_reporter', sa.String(length=128), nullable=True),
    sa.Column('references_sources', sa.String(length=256), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('background_info')
    # ### end Alembic commands ###