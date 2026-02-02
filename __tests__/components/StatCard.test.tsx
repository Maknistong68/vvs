// Tests for components/StatCard.tsx
import React from 'react';
import { render } from '@testing-library/react-native';
import StatCard from '../../components/StatCard';

describe('StatCard', () => {
  const defaultProps = {
    title: 'Total',
    value: 42,
    icon: 'car-multiple',
    color: '#8B5CF6',
  };

  it('renders title and value correctly', () => {
    const { getByText } = render(<StatCard {...defaultProps} />);

    expect(getByText('Total')).toBeTruthy();
    expect(getByText('42')).toBeTruthy();
  });

  it('renders with string value', () => {
    const { getByText } = render(
      <StatCard {...defaultProps} value="100+" />
    );

    expect(getByText('100+')).toBeTruthy();
  });

  it('renders with custom gradient', () => {
    const { getByText } = render(
      <StatCard
        {...defaultProps}
        gradient={['#ff0000', '#00ff00']}
      />
    );

    expect(getByText('Total')).toBeTruthy();
  });

  it('provides accessibility label', () => {
    const { getByLabelText } = render(<StatCard {...defaultProps} />);

    expect(getByLabelText('Total: 42')).toBeTruthy();
  });

  it('renders with testID', () => {
    const { getByTestId } = render(
      <StatCard {...defaultProps} testID="stat-card" />
    );

    expect(getByTestId('stat-card')).toBeTruthy();
  });

  it('renders different colors correctly', () => {
    const colors = ['#10B981', '#EF4444', '#F59E0B', '#3B82F6'];

    colors.forEach((color) => {
      const { getByText } = render(
        <StatCard {...defaultProps} color={color} title={`Color ${color}`} />
      );

      expect(getByText(`Color ${color}`)).toBeTruthy();
    });
  });

  it('renders zero value', () => {
    const { getByText } = render(
      <StatCard {...defaultProps} value={0} />
    );

    expect(getByText('0')).toBeTruthy();
  });

  it('renders large values', () => {
    const { getByText } = render(
      <StatCard {...defaultProps} value={99999} />
    );

    expect(getByText('99999')).toBeTruthy();
  });
});
