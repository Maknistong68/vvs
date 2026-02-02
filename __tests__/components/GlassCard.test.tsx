// Tests for components/GlassCard.tsx
import React from 'react';
import { render, fireEvent } from '@testing-library/react-native';
import { Text } from 'react-native';
import GlassCard from '../../components/GlassCard';

describe('GlassCard', () => {
  it('renders children correctly', () => {
    const { getByText } = render(
      <GlassCard>
        <Text>Test Content</Text>
      </GlassCard>
    );

    expect(getByText('Test Content')).toBeTruthy();
  });

  it('renders with different variants', () => {
    const variants = ['default', 'elevated', 'accent', 'success', 'error', 'warning'] as const;

    variants.forEach((variant) => {
      const { getByText } = render(
        <GlassCard variant={variant}>
          <Text>{variant}</Text>
        </GlassCard>
      );

      expect(getByText(variant)).toBeTruthy();
    });
  });

  it('handles press events', () => {
    const onPress = jest.fn();
    const { getByRole } = render(
      <GlassCard onPress={onPress} accessibilityLabel="Press me">
        <Text>Pressable Card</Text>
      </GlassCard>
    );

    const button = getByRole('button');
    fireEvent.press(button);

    expect(onPress).toHaveBeenCalledTimes(1);
  });

  it('applies custom padding', () => {
    const { getByText } = render(
      <GlassCard padding={32}>
        <Text>Custom Padding</Text>
      </GlassCard>
    );

    expect(getByText('Custom Padding')).toBeTruthy();
  });

  it('renders elevated style', () => {
    const { getByText } = render(
      <GlassCard elevated>
        <Text>Elevated Card</Text>
      </GlassCard>
    );

    expect(getByText('Elevated Card')).toBeTruthy();
  });

  it('provides accessibility props when pressable', () => {
    const { getByRole, getByLabelText } = render(
      <GlassCard
        onPress={() => {}}
        accessibilityLabel="Test Card"
        accessibilityHint="Tap to open"
      >
        <Text>Accessible Card</Text>
      </GlassCard>
    );

    expect(getByRole('button')).toBeTruthy();
    expect(getByLabelText('Test Card')).toBeTruthy();
  });

  it('renders with testID', () => {
    const { getByTestId } = render(
      <GlassCard testID="test-card">
        <Text>Test Card</Text>
      </GlassCard>
    );

    expect(getByTestId('test-card')).toBeTruthy();
  });
});
