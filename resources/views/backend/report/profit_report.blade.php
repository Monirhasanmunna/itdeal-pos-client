@extends('backend.layout.main') @section('content')
  <div class="container-fluid">

    <div class="row mt-4">
      <div class="col-md-4 offset-md-4">
        <div class="card">
          <form>
            <div class="card-body">
              <h3 class="text-center">{{ __('Filter') }}</h3>
              <div class="form-group">
                <label for="start_date" class="form-label">{{ __('Start date') }}</label>
                <input type="date" value="{{ $start_date ?? null }}" name="start_date" id="start_date"
                  class="form-control">
              </div>
              <div class="form-group">
                <label for="start_date" class="form-label">{{ __('Start date') }}</label>
                <input type="date" name="end_date" id="end_date" class="form-control" value="{{ $end_date ?? null }}">
              </div>

              <button type="submit" class="btn btn-primary">Submit</button>
              @if (request()->start_date || request()->end_date)
                <a href="{{ route('report.profit_report') }}" class="btn btn-danger">{{ __('Clear') }}</a>
              @endif
            </div>
          </form>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-md-4 offset-md-4">
        <div class="card my-5">
          <div class="card-header text-center">
            <h1 style="font-size: 2rem; margin-bottom: 12px !important;">{{ __('Profit Report') }}</h1>
            <h3>Date: {{ date('d/m/Y', strtotime($start_date)) }} to
              {{ date('d/m/Y', strtotime($end_date)) }}</h3>
          </div>
          <div class="card-body">
            <table class="table">
              <tr>
                <th>{{ __('Total Sale') }}</th>
                <td>{{ $total_sale }}</td>
              </tr>
              <tr>
                <th>{{ __('Total Cost') }}</th>
                <td>{{ $total_cost }}</td>
              </tr>
              <tr>
                <th>{{ __('Gross Profit') }}</th>
                <td>{{ $total_sale - $total_cost }}</td>
              </tr>
              <tr>
                <th>{{ __('Expense') }}</th>
                <td>{{ $total_expense }}</td>
              </tr>
              <tr>
                <th>{{ __('Net Profit') }}</th>
                <td>{{ $total_sale - $total_cost - $total_expense }}</td>
              </tr>
            </table>
          </div>
        </div>
      </div>
    </div>

  </div>
@endsection
@push('scripts')
  <script type="text/javascript"></script>
@endpush
