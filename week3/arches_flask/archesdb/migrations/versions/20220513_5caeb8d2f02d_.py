"""empty message

Revision ID: 5caeb8d2f02d
Revises: 207eb1e7fcc4
Create Date: 2022-05-13 17:59:16.132676

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '5caeb8d2f02d'
down_revision = '207eb1e7fcc4'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('trails',
    sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('name', sa.String(length=128), nullable=False),
    sa.Column('difficulty_level', sa.String(length=256), nullable=True),
    sa.Column('map_id', sa.Integer(), nullable=False),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('name')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('trails')
    # ### end Alembic commands ###
